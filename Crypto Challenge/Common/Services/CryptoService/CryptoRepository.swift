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
    
    private(set) var isConnected = false
    private(set) lazy var coins = [CryptoCurrency]()
    
    init(databaseService: DatabaseService) {
        self.databaseService = databaseService
        loadCoinsFromDatabase()
        let _ = cryptoApi.connect()
        setupObservers()
    }
}

// MARK: Crypto API Delegate
extension CryptoRepository: CryptoDelegate {
    
    func cryptoAPIDidConnect() {
        isConnected = true
        loadCoinsFromApi()
    }
    
    func cryptoAPIDidUpdateCoin(_ coin: Coin) {
        guard let storedCoin = self.coin(code: coin.code) else {
            return
        }
        if storedCoin.minPrice > coin.price {
            // update min price
        }
        else if storedCoin.maxPrice < coin.price {
            // update max price
        }
        storedCoin.price = coin.price
        storedCoin.imageUrl = coin.imageUrl
    }
    
    func cryptoAPIDidDisconnect() {
        isConnected = false
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
    
    private func loadCoinsFromDatabase() {
        coins = databaseService.fetch(CryptoCurrency.self, filter: nil)
    }
    
    private func loadCoinsFromApi() {
        let entities = cryptoApi.getAllCoins().map { CryptoCurrency(currency: $0) }
        self.coins = entities
        databaseService.update(entities)
    }
}

// MARK: - Helpers
extension CryptoRepository {
    
    private func coin(code: String) -> CryptoCurrency? {
        return coins.first(where: { $0.code == code })
    }
}
