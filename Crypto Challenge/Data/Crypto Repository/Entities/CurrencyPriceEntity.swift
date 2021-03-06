//
//  CurrencyPriceUpdate.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation
import RealmSwift
import PredicateFlow

class CurrencyPriceEntity: Object, PredicateSchema {
    @objc dynamic var currencyCode: String = ""
    @objc dynamic var timestamp: Int64 = 0
    @objc dynamic var price: Double = 0
}
