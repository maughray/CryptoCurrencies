//
//  CryptoCurrency.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation
import RealmSwift
import PredicateFlow

class CryptoCurrency: Object, Currency, PredicateSchema {
    @objc dynamic var name: String = ""
    @objc dynamic var code: String = ""
    @objc dynamic var imageUrl: String?
    @objc dynamic var price: Double = 0
    @objc dynamic var maxPrice: Double = 0
    @objc dynamic var minPrice: Double = 0
    
    override init() {}
    
    init(currency: Currency) {
        self.name = currency.name
        self.code = currency.code
        self.imageUrl = currency.imageUrl
        self.price = currency.price
    }
    
    static override func primaryKey() -> String? {
        return "code"
    }
}
