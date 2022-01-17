//
//  Currency.swift
//  Crypto Challenge
//
//  Created by maughray on 1/17/22.
//

import Foundation

protocol Currency {
    var name: String { get set }
    var code: String { get set }
    var price: Double { get set }
    var imageUrl: String? { get set }
    var maxPrice: Double { get set }
    var minPrice: Double { get set }
}
