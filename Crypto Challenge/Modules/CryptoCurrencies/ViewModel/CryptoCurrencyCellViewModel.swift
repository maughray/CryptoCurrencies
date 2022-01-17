//
//  CryptoCurrencyCellViewModel.swift
//  Crypto Challenge
//
//  Created by Victor Morei on 1/15/22.
//

import UIKit

class CryptoCurrencyCellViewModel {

    private(set) var currency: CryptoCurrency
    
    var minPriceAttributedString: NSAttributedString {
        return getPriceAttributedString(value: currency.minPrice, prefix: "min:")
    }
    
    var maxPriceAttributedString: NSAttributedString {
        return getPriceAttributedString(value: currency.maxPrice, prefix: "max:")
    }
    
    var currentPrice: String {
        return " $\(currency.price) "
    }
    
    init(currency: CryptoCurrency) {
        self.currency = currency
    }
    
    // Bindings
    var onPriceDidChane: ((Double, UIColor) -> Void)?
    var onMinPriceDidChange: ((Double) -> Void)?
    
    func updatePrice(value: Double) {
        currency.price = value
        var color = UIColor.clear
        //if currency.
    }
    
    func updateMinPrice(value: Double) {
        
    }
    
    func updateMaxPrice(value: Double) {
        
    }
    
    private func getPriceAttributedString(value: Double, prefix: String) -> NSAttributedString {
        let priceText = "$\(value)"
        let attributed = NSMutableAttributedString(string: "\(prefix) \(priceText)")
        attributed.setFont(.systemFont(ofSize: 10, weight: .light), forText: prefix)
        attributed.setFont(.systemFont(ofSize: 12, weight: .regular), forText: priceText)
        attributed.setColor(color: .lightGray, forText: prefix)
        attributed.setColor(color: .black, forText: priceText)
        return attributed
    }
}
