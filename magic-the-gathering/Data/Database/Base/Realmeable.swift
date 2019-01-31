//
//  Realmeable.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 31/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import RealmSwift

protocol Realmeable: Equatable {
    static var realmType: Object.Type { get }
    var realmObject: Object { get }
    
    static func convert(from object: Object) -> Self
    func equals(object: Object) -> Bool
}
