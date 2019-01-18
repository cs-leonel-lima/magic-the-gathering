//
//  Card.swift
//  magic-the-gathering
//
//  Created by isabel.isaura.l.lima on 18/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

struct Card {
    let name: String
    let types: [String]
    let imageUrl: String
    let set: String
    
    private enum CodingKeys: CodingKey {
        case name, types, imageUrl, set
    }
}

extension Card: Decodable {
    init(from decoder: Decoder) throws {
        let cardContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try cardContainer.decode(String.self, forKey: .name)
        types = try cardContainer.decode([String].self, forKey: .types)
        imageUrl = try cardContainer.decode(String.self, forKey: .imageUrl)
        set = try cardContainer.decode(String.self, forKey: .set)
        
    }
}

extension Card: Equatable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.name == rhs.name
    }
}
