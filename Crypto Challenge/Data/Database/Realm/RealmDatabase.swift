import Foundation
import RealmSwift
import PredicateFlow

typealias DBModel = Object

final class RealmDatabase: DatabaseService {
    
    private var realm: Realm?
    private let schemaVersion: Int = 1
        
    init() {
        initializeDatabase()
    }
    
    private func initializeDatabase() {
        let config = Realm.Configuration(
            schemaVersion: UInt64(schemaVersion),
            migrationBlock: { _,_ in })
        
        Realm.Configuration.defaultConfiguration = config
        realm = try? Realm()
    }
    
    func fetch<T: Object>(_ type: T.Type, filter: NSPredicate?) -> [T] {
        guard var data = realm?.objects(T.self) else {
            return []
        }
        if let filter = filter {
            data = data.filter(filter)
        }
        return Array(data)
    }
    
    func add(_ data: [Object]) {
        try? realm?.write {
            realm?.add(data)
        }
    }
    
    func delete<T: Object>(_ objects: [T]) {
        try? realm?.write {
            realm?.delete(objects)
        }
    }
}
