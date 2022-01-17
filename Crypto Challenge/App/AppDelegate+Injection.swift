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
        let databaseService = RealmDatabase()
        let cryptoRep = CryptoRepository(databaseService: databaseService)
        register { cryptoRep }.implements(CryptoRepositoryProtocol.self).scope(.application)
    }
}
