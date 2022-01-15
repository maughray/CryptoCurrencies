//
//  CryptoCurrency.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation

class CryptoCurrency {
    var name: String
    var imageUrl: String
    var price: Float
    
    init(name: String, imageUrl: String, price: Float) {
        self.name = name
        self.imageUrl = imageUrl
        self.price = price
    }
}
