//
//  CryptoRepositoryProtocol.swift
//  Crypto Challenge
//
//  Created by maughray on 1/17/22.
//

import Foundation

protocol CryptoRepositoryProtocol {
    var isConnected: Bool { get }
    var delegate: CryptoRepositoryDelegate? { get set }
    
    func getCurrencies() -> [Currency]
}
