//
//  MockCryptoService.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation

class MockCryptoServie: CryptoService {
    weak var delegate: CryptoServiceDelegate?
    
    init() {
        sendRandomUpdates()
    }
    
    private func sendRandomUpdates() {
        let s = Int.random(in: 10...600)
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(s), execute: {
            self.delegate?.cryptoService(didReceivePriceUpdate: self.getRandomCrypto(), price: Float.random(in: 100...10000))
            self.sendRandomUpdates()
        })
    }
    
    private func getRandomCrypto() -> String {
        return ["BTC", "LTC", "ETH", "ADA", "XLM"].randomElement()!
    }
}
