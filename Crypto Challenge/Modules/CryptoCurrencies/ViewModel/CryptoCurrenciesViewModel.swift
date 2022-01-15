//
//  CryptoCurrenciesViewModel.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation

class CryptoCurrenciesViewModel {
    
    private(set) lazy var currencyCellsViewModels = [CryptoCurrencyCellViewModel]()
    
    init() {
        currencyCellsViewModels.append(contentsOf: [
            CryptoCurrencyCellViewModel(
                name: "Bitcoin",
                code: "BTC",
                currentPrice: 42655,
                minPrice: 55,
                maxPrice: 45888)
        ])
    }
}
