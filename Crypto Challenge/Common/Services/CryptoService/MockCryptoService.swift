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
        
    }
}
