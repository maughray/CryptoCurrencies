//
//  CryptoCurrencyCellViewModel.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation

struct CryptoCurrencyCellViewModel {
    var name: String
    var code: String
    var currentPrice: Float
    var minPrice: Float
    var maxPrice: Float
    
    var minPriceAttributedString: NSAttributedString {
        return getPriceAttributedString(value: minPrice, prefix: "min:")
    }
    
    var maxPriceAttributedString: NSAttributedString {
        return getPriceAttributedString(value: maxPrice, prefix: "max:")
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
