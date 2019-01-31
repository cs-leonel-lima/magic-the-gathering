//
//  FavoriteCard.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 31/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Realm
import RealmSwift

class FavoriteCard: Object {
    @objc dynamic var id: String
    @objc dynamic var name: String
    @objc dynamic var imageURL: String?
    @objc dynamic var mtgCodeSet: String
    
    let types: List<String>
    
    init(card: Card) {
        id = card.id
        name = card.name
        imageURL = card.imageURL
        mtgCodeSet = card.mtgCodeSet
        types = List<String>()
        
        super.init()
        
        card.types.forEach { self.types.append($0) }
    }
    
    required init() {
        id = ""
        name = ""
        imageURL = nil
        mtgCodeSet = ""
        types = List<String>()
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        id = ""
        name = ""
        imageURL = nil
        mtgCodeSet = ""
        types = List<String>()
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        id = ""
        name = ""
        imageURL = nil
        mtgCodeSet = ""
        types = List<String>()
        super.init(value: value, schema: schema)
    }
}
