//
//  CryptoRepositoryProtocol.swift
//  Crypto Challenge
//
//  Created by maughray on 1/17/22.
//

import Foundation

protocol CryptoRepositoryProtocol {
    var delegate: CryptoRepositoryDelegate? { get set }
    func getCurrencies() -> [Currency]
}
