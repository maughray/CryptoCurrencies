//
//  DatabaseService.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import Foundation

protocol DatabaseService {
    func fetch<T: DBModel>(_ type: T.Type, filter: NSPredicate?) -> [T]
    func add(_ data: [DBModel])
    func delete<T: DBModel>(_ objects: [T])
}
