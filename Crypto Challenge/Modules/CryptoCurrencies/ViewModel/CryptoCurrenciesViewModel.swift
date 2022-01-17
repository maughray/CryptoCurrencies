//
//  CryptoCurrenciesViewModel.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation
import Resolver

class CryptoCurrenciesViewModel {
    
    private(set) lazy var currencyCellsViewModels = [CryptoCurrencyCellViewModel]()
    
    @LazyInjected private var cryptoRepository: CryptoRepository
    
    // Bindings
    var onCurrenciesDidReload: (() -> Void)?
    
    init() {
        reloadCurrencies()
        cryptoRepository.delegate = self
    }
    
    private func reloadCurrencies() {
        let currencies = cryptoRepository.getCurrencies().map { CryptoCurrency(currency: $0) }
        currencyCellsViewModels = currencies.map { CryptoCurrencyCellViewModel(currency: $0) }
        onCurrenciesDidReload?()
    }
    
    private func getCellViewModel(coinCode: String) -> CryptoCurrencyCellViewModel? {
        return currencyCellsViewModels.first(where: { $0.currency.code == coinCode })
    }
}

// MARK: - Crypto service delegate
extension CryptoCurrenciesViewModel: CryptoRepositoryDelegate {
    
    func cryptoRepository(didUpdateMinPrice coin: Currency) {
        DispatchQueue.main.async {
            self.getCellViewModel(coinCode: coin.code)?.updateMinPrice(value: coin.minPrice)
        }
    }
    
    func cryptoRepository(didUpdateMaxPrice coin: Currency) {
        DispatchQueue.main.async {
            self.getCellViewModel(coinCode: coin.code)?.updateMaxPrice(value: coin.maxPrice)
        }
    }
    
    func cryptoRepository(didUpdatePrice coin: Currency) {
        DispatchQueue.main.async {
            self.getCellViewModel(coinCode: coin.code)?.updatePrice(value: coin.price)
        }
    }
    
    func cryptoRepositoryDidReloadCurrencies() {
        self.reloadCurrencies()
    }
}
