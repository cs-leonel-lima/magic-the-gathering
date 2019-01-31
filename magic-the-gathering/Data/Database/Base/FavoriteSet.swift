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
        fatalError("init() has not been implemented")
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
}
