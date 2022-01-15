//
//  CryptoService.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation

protocol CryptoService {
    var delegate: CryptoServiceDelegate? { get set }
}

protocol CryptoServiceDelegate: AnyObject {
    func cryptoService(didReceivePriceUpdate currency: CryptoCurrency)
}
