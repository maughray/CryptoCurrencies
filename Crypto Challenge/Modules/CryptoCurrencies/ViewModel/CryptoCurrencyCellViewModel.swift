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
        return getPriceAttributedString(value: currency.minPrice.priceFormatted, prefix: "min:")
    }
    
    var maxPriceAttributedString: NSAttributedString {
        return getPriceAttributedString(value: currency.maxPrice.priceFormatted, prefix: "max:")
    }
    
    var currentPrice: String {
        return " $\(currency.price.priceFormatted) "
    }
    
    init(currency: CryptoCurrency) {
        self.currency = currency
    }
    
    // Bindings
    var onPriceDidChane: ((UIColor) -> Void)?
    var onMinPriceDidChange: (() -> Void)?
    var onMaxPriceDidChange: (() -> Void)?
    
    func updatePrice(value: Double) {
        var color = UIColor.clear
        if currency.price < value {
            color = .green
        } else if currency.price > value {
            color = .red
        }
        currency.price = value
        onPriceDidChane?(color)
    }
    
    func updateMinPrice(value: Double) {
        currency.minPrice = value
        onMinPriceDidChange?()
    }
    
    func updateMaxPrice(value: Double) {
        currency.maxPrice = value
        onMaxPriceDidChange?()
    }
    
    private func getPriceAttributedString(value: String, prefix: String) -> NSAttributedString {
        let priceText = "$\(value)"
        let attributed = NSMutableAttributedString(string: "\(prefix) \(priceText)")
        attributed.setFont(.systemFont(ofSize: 10, weight: .light), forText: prefix)
        attributed.setFont(.systemFont(ofSize: 12, weight: .regular), forText: priceText)
        attributed.setColor(color: .lightGray, forText: prefix)
        attributed.setColor(color: .black, forText: priceText)
        return attributed
    }
}


