//
//  Currency.swift
//  Crypto Challenge
//
//  Created by maughray on 1/17/22.
//

import Foundation

protocol Currency {
    var name: String { get }
    var code: String { get }
    var price: Double { get }
    var imageUrl: String? { get }
}
