//
//  Card.swift
//  magic-the-gathering
//
//  Created by isabel.isaura.l.lima on 18/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

struct Card {
    let id: String
    let name: String
    let types: [String]
    var imageURL: String?
    let mtgCodeSet: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
        case mtgCodeSet = "set"
        case imageURL = "imageUrl"
    }
}

extension Card: Decodable {
    init(from decoder: Decoder) throws {
        let cardContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try cardContainer.decode(String.self, forKey: .id)
        name = try cardContainer.decode(String.self, forKey: .name)
        types = try cardContainer.decode([String].self, forKey: .types)
        imageURL = try cardContainer.decodeIfPresent(String.self, forKey: .imageURL)
        mtgCodeSet = try cardContainer.decode(String.self, forKey: .mtgCodeSet)
        
    }
}

extension Card {
    static func initializeCardsArray(from data: Data) -> [Card]? {
        do {
            let cardsDictionary = try JSONDecoder().decode([String: [Card]].self, from: data)
            if let cards = cardsDictionary["cards"] {
                return cards
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Card {
    static func mock() -> [Card] {
        return [Card(id: "a33b5d94-ecef-5941-9ece-f6f50e0f2dfd", name: "Ancestor's Chosen", types: ["Creature"], imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card", mtgCodeSet: "10E"),
        Card(id: "2d040ab5-3430-5505-8fd0-a99666a3913e", name: "Angel of Mercy", types: ["Creature"], imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129465&type=card", mtgCodeSet: "10E"),
        Card(id: "04914cd6-5007-5f1a-aaab-8be7948c6081", name: "Angelic Blessing", types: ["Sorcery"], imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129711&type=card", mtgCodeSet: "10E"),
        Card(id: "10E", name: "Angelic Chorus", types: ["Enchantment"], imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129710&type=card", mtgCodeSet: "1b6cbae4-9bf9-5a57-ab88-82d6e46481e8"),
        Card(id: "21132c2c-b544-52d8-bb8d-4e7c897bd6a9", name: "Angelic Wall", types: ["Creature"], imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129671&type=card", mtgCodeSet: "10E"),
        Card(id: "52b74be2-4538-56cc-aa29-f8032eef5544", name: "Aura of Silence", types: ["Enchantment"], imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=132127&type=card", mtgCodeSet: "10E"),
        Card(id: "a74340fd-65fa-591f-96d0-4be542cb1b2a", name: "Aven Cloudchaser", types: ["Creature"], imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129470&type=card", mtgCodeSet: "10E")]
    }
}
