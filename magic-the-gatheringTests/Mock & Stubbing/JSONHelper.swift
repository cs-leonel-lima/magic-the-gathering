//
//  JSONHelper.swift
//  magic-the-gatheringTests
//
//  Created by isabel.isaura.l.lima on 18/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation
@testable import magic_the_gathering

class JSONHelper {
    static func objectFrom<T: Decodable>(resource name: String) -> [T]? {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let object = try JSONDecoder().decode([String: [T]].self, from: data)
                return object[name]
            } catch {
//                print(error)
                return nil
            }
        }
        return nil
    }
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
