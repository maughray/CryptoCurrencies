//
//  CurrencyPriceUpdate.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation
import RealmSwift

class CurrencyPrice: Object {
    @objc dynamic var timestamp: Int64 = 0
    @objc dynamic var price: Float = 0
}
