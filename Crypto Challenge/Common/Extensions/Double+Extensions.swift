//
//  Double+Extensions.swift
//  Crypto Challenge
//
//  Created by Victor Morei on 17.01.2022.
//

import Foundation

extension Double {
    
    var priceFormatted: String {
        var arr = Array(String(self)).prefix(8)
        if arr.last == "." {
            arr.removeLast()
        }
        return String(arr)
    }
}
