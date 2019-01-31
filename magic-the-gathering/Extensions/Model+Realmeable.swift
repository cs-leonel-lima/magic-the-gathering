//
//  Model+Realmeable.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 31/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import RealmSwift

extension MTGSet: Realmeable {
    static var realmType: Object.Type {
        return FavoriteSet.self
    }
    var realmObject: Object {
        return FavoriteSet(set: self)
    }
    static func convert(from object: Object) -> MTGSet {
        guard let typedObject = object as? FavoriteSet else {
            fatalError()
        }
        return MTGSet(name: typedObject.name,
                      code: typedObject.code,
                      releaseDate: typedObject.releaseDate)
    }
    func equals(object: Object) -> Bool {
        guard let typedObject = object as? FavoriteSet else {
            fatalError()
        }
        return typedObject.code == code
    }
}

extension Card: Realmeable {
    static var realmType: Object.Type {
        return FavoriteCard.self
    }
    var realmObject: Object {
        return FavoriteCard(card: self)
    }
    static func convert(from object: Object) -> Card {
        guard let typedObject = object as? FavoriteCard else {
            fatalError()
        }
        var types = [String]()
        typedObject.types.forEach { types.append($0) }
        return Card(id: typedObject.id,
                    name: typedObject.name,
                    types: types,
                    imageURL: typedObject.imageURL,
                    mtgCodeSet: typedObject.mtgCodeSet)
    }
    func equals(object: Object) -> Bool {
        guard let typedObject = object as? FavoriteCard else {
            fatalError()
        }
        return typedObject.id == id
    }
}
