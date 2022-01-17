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
    
    init() {
        //let currencies = databaseService.fetch(CryptoCurrency.self, filter: nil)
        //currencyCellsViewModels = currencies.map { CryptoCurrencyCellViewModel(currency: $0) }
        cryptoRepository.delegate = self
    }
}

// MARK: - Crypto service delegate
extension CryptoCurrenciesViewModel: CryptoRepositoryDelegate {
    
    func cryptoRepository(didReload coins: [Currency]) {
        
    }
}
