//
//  MockCryptoService.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import UIKit
import CryptoAPI
import PredicateFlow

class CryptoRepository: CryptoRepositoryProtocol {
    
    private var databaseService: DatabaseService
    weak var delegate: CryptoRepositoryDelegate?
    private lazy var cryptoApi = Crypto(delegate: self)
    
    private(set) lazy var coins = [CryptoCurrency]()
    
    init(databaseService: DatabaseService) {
        self.databaseService = databaseService
        let _ = cryptoApi.connect()
        setupObservers()
    }
    
    func getCurrencies() -> [Currency] {
        return coins
    }
    
    private func index(of coinCode: String) -> Int? {
        return coins.firstIndex(where: { $0.code == coinCode })
    }
}

// MARK: Crypto API Delegate
extension CryptoRepository: CryptoDelegate {
    
    func cryptoAPIDidConnect() {
        loadCoins()
    }
    
    func cryptoAPIDidUpdateCoin(_ coin: Coin) {
        guard let index = index(of: coin.code) else {
            return
        }
        coins[index].price = coin.price
        if coins[index].minPrice > coin.price {
            coins[index].minPrice = coin.price
            delegate?.cryptoRepository(didUpdateMinPrice: coins[index])
        }
        else if coins[index].maxPrice < coin.price {
            coins[index].maxPrice = coin.price
            delegate?.cryptoRepository(didUpdateMaxPrice: coins[index])
        }
        saveCoinPrice(coin.price, coinCode: coin.code)
        delegate?.cryptoRepository(didUpdatePrice: self.coins[index])
    }
    
    func cryptoAPIDidDisconnect() {
        let result = cryptoApi.connect()
        handleConnectionResult(result: result)
    }
}

// MARK: - Observation
private extension CryptoRepository {
    
    private func setupObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self,
            selector: #selector(applicationDidEnterBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil)
        
        notificationCenter.addObserver(
            self,
            selector: #selector(applicationWillEnterFroreground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil)
    }
    
    @objc func applicationDidEnterBackground() {
        cryptoApi.disconnect()
    }
    
    @objc func applicationWillEnterFroreground() {
        let _ = cryptoApi.connect()
    }
}

// MARK: Data management
extension CryptoRepository {

    private func loadCoins() {
        guard coins.isEmpty else { return }
        for coin in cryptoApi.getAllCoins() {
            let (min, max) = getExtremePrices(for: coin.code)
            coins.append(CryptoCurrency(coin: coin, minPrice: min, maxPrice: max))
        }
        self.delegate?.cryptoRepositoryDidReloadCurrencies()
    }
    
    private func saveCoinPrice(_ price: Double, coinCode: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            let entity = CurrencyPriceEntity()
            entity.currencyCode = coinCode
            entity.timestamp = Date().millisecondsSince1970
            entity.price = price
            self.databaseService.add([entity])
        }
    }
    
    private func getExtremePrices(for coinCode: String) -> (Double?, Double?){
        let predicate = CurrencyPriceEntitySchema.currencyCode.is(coinCode).predicate
        let prices = databaseService.fetch(CurrencyPriceEntity.self, filter: predicate)
        if prices.isEmpty {
            return (nil, nil)
        }
        return prices.reduce((Double.greatestFiniteMagnitude, -Double.greatestFiniteMagnitude)) {
            (min($0.0, $1.price), max($0.1, $1.price))
        }
    }
}

// MARK: - Connection status handling
private extension CryptoRepository {
    
    func handleConnectionResult(result: Result<Bool, Error>) {
        switch result {
        case .failure(let error):
            if let cryptoError = error as? CryptoAPI.CryptoError {
                handleConnectionError(cryptoError)
            }
        default:
            break
        }
    }
    
    private func handleConnectionError(_ error: CryptoError) {
        switch error {
        case .connectAfter(let date):
            reconnectAt(date: date)
        @unknown default:
            break
        }
    }
    
    private func reconnectAt(date: Date) {
        let timer = Timer(
            fireAt: date,
            interval: 0,
            target: self,
            selector: #selector(reconnect),
            userInfo: nil,
            repeats: false
        )
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @objc private func reconnect() {
        let result = cryptoApi.connect()
        handleConnectionResult(result: result)
    }
}

// MARK: - Helper CryptoCurrency initializer
private extension CryptoCurrency {
    
    init(coin: Coin, minPrice: Double?, maxPrice: Double?) {
        self.name = coin.name
        self.code = coin.code
        self.price = coin.price
        self.imageUrl = coin.imageUrl
        self.minPrice = minPrice ?? price
        self.maxPrice = maxPrice ?? price
    }
}
