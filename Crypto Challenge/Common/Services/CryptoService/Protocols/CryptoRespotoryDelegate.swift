//
//  CryptoRespotoryDelegate.swift
//  Crypto Challenge
//
//  Created by maughray on 1/17/22.
//

import Foundation

protocol CryptoRepositoryDelegate: AnyObject {
    func cryptoRepository(didReload coins: [Currency])
    func cryptoRepository(coinCode: String, didUpdateMinPrice price: Double)
    func cryptoRepository(coinCode: String, didUpdateMaxPrice price: Double)
    func cryptoRepository(coinCode: String, didUpdatePrice price: Double)
}
