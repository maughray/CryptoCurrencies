//
//  CryptoRespotoryDelegate.swift
//  Crypto Challenge
//
//  Created by maughray on 1/17/22.
//

import Foundation

protocol CryptoRepositoryDelegate: AnyObject {
    func cryptoRepositoryDidReloadCurrencies()
    func cryptoRepository(didUpdateMinPrice currency: Currency)
    func cryptoRepository(didUpdateMaxPrice currency: Currency)
    func cryptoRepository(didUpdatePrice currency: Currency)
}
