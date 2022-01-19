//
//  CryptoDetailsViewModel.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation

class CurrencyDetailsViewModel {
    
    private(set) var currency: Currency
    private(set) var chartViewModel: CryptoChartViewModel
    
    init(currency: Currency) {
        self.currency = currency
        chartViewModel = CryptoChartViewModel(currency: currency)
    }
}
