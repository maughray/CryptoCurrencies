//
//  CryptoCurrency.swift
//  Crypto Challenge
//
//  Created by Victor Morei on 17.01.2022.
//

import Foundation

struct CryptoCurrency: Currency {
    var name: String
    var code: String
    var price: Double
    var imageUrl: String?
    var maxPrice: Double
    var minPrice: Double
    
    init(currency: Currency) {
        self.name = currency.name
        self.code = currency.code
        self.price = currency.price
        self.imageUrl = currency.imageUrl
        self.maxPrice = currency.maxPrice
        self.minPrice = currency.minPrice
    }
}
