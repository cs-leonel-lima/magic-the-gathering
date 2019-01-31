//
//  DataAccessObject.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 31/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import RealmSwift

class DataAccessObject<T> where T: Realmeable {
    
    private let realm: Realm
    
    init() throws {
        realm = try Realm(configuration: .defaultConfiguration)
    }
    
    func create(object: T) {
        realm.add(object.realmObject)
    }
    
    func delete(object: T) {
        realm.delete(object.realmObject)
    }
    
    func getAll() -> [T] {
        let objects = realm.objects(T.realmType)
        return objects.map { T.convert(from: $0) }
    }
    
    func contains(object: T) -> Bool {
        return getAll().contains(object)
    }
}
