//
//  CryptoCurrencyCellViewModel.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation

struct CryptoCurrencyCellViewModel {

    private(set) var minPrice: Float
    private(set) var maxPrice: Float
    private(set) var currency: CryptoCurrency
    
    var minPriceAttributedString: NSAttributedString {
        return getPriceAttributedString(value: minPrice, prefix: "min:")
    }
    
    var maxPriceAttributedString: NSAttributedString {
        return getPriceAttributedString(value: maxPrice, prefix: "max:")
    }
    
    var currentPrice: String {
        return " $\(currency.currentPrice) "
    }
    
    init(currency: CryptoCurrency) {
        minPrice = 0
        maxPrice = 0
        self.currency = currency
        
        // TODO: calculate mix & max prices
    }
    
    private func getPriceAttributedString(value: Float, prefix: String) -> NSAttributedString {
        let priceText = "$\(value)"
        let attributed = NSMutableAttributedString(string: "\(prefix) \(priceText)")
        attributed.setFont(.systemFont(ofSize: 10, weight: .light), forText: prefix)
        attributed.setFont(.systemFont(ofSize: 12, weight: .regular), forText: priceText)
        attributed.setColor(color: .lightGray, forText: prefix)
        attributed.setColor(color: .black, forText: priceText)
        return attributed
    }
}
