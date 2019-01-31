//
//  FavoriteSet.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 31/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Realm
import RealmSwift

class FavoriteSet: Object {
    @objc dynamic var name: String
    @objc dynamic var code: String
    @objc dynamic var releaseDate: Date?
    
    init(set: MTGSet) {
        name = set.name
        code = set.code
        releaseDate = set.releaseDate
        super.init()
    }
    
    required init() {
        name = ""
        code = ""
        releaseDate = nil
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        name = ""
        code = ""
        releaseDate = nil
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        name = ""
        code = ""
        releaseDate = nil
        super.init(value: value, schema: schema)
    }
}
