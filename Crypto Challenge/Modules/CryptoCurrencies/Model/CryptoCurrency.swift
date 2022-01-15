//
//  CryptoCurrency.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation
import RealmSwift

class CryptoCurrency: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var code: String = ""
    @objc dynamic var imageName: String = ""
    var prices = List<CurrencyPrice>()
    
    static override func primaryKey() -> String? {
        return "code"
    }

    var currentPrice: Float {
        return prices.last?.price ?? 0
    }
}
