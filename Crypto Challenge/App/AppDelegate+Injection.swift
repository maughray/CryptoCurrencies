//
//  AppDelegate+Injection.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        register { RealmDatabase() }.implements(DatabaseService.self).scope(.application)
        register { MockCryptoServie() }.implements(CryptoService.self).scope(.application)
    }
}
