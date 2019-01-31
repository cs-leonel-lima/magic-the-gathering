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
    @objc dynamic var types: [String]
    @objc dynamic var imageURL: String?
    @objc dynamic var mtgCodeSet: String
    
    init(card: Card) {
        id = card.id
        name = card.name
        types = card.types
        imageURL = card.imageURL
        mtgCodeSet = card.mtgCodeSet
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
