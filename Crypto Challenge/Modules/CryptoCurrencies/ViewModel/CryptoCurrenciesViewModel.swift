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
    var onCurrencyDidUpdatePrice: ((Int, Double) -> Void)?
    var onCurrencyDidUpdateMinPrice: ((Int, Double) -> Void)?
    var onCurrencyDidUpdateMaxPrice: ((Int, Double) -> Void)?
    
    init() {
        reloadCurrencies()
        cryptoRepository.delegate = self
    }
    
    private func reloadCurrencies() {
        let currencies = cryptoRepository.getCurrencies().map { CryptoCurrency(currency: $0) }
        currencyCellsViewModels = currencies.map { CryptoCurrencyCellViewModel(currency: $0) }
        onCurrenciesDidReload?()
    }
}

// MARK: - Crypto service delegate
extension CryptoCurrenciesViewModel: CryptoRepositoryDelegate {
    
    func cryptoRepository(didUpdateMinPrice coin: Currency) {
        onCurrencyDidUpdateMinPrice?(0, coin.price)
    }
    
    func cryptoRepository(didUpdateMaxPrice coin: Currency) {
        onCurrencyDidUpdateMaxPrice?(0, coin.price)
    }
    
    func cryptoRepository(didUpdatePrice coin: Currency) {
        onCurrencyDidUpdatePrice?(0, coin.price)
    }
    
    func cryptoRepositoryDidReloadCurrencies() {
        self.reloadCurrencies()
    }
}
