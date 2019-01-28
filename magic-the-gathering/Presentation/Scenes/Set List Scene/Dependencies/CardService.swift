//
//  CardService.swift
//  magic-the-gathering
//
//  Created by isabel.isaura.l.lima on 28/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

protocol CardsService {
    func getCards(completion: @escaping (_ result: MagicAPIResult<[Card]>) -> Void)
}

class LocalCardsService: CardsService {
    func getCards(completion: @escaping (_ result: MagicAPIResult<[Card]>) -> Void) {
        let cards: [Card] = JSONHelper.objectFrom(resource: "cards") ?? []
        let successCase = MagicAPIResult.success(cards)
        completion(successCase)
    }
}

class RemoteCardsService: CardsService {
    func getCards(completion: @escaping (MagicAPIResult<[Card]>) -> Void) {
        let cards: [Card] = JSONHelper.objectFrom(resource: "cards") ?? []
        let successCase = MagicAPIResult.success(cards)
        completion(successCase)
    }
}

// Temporary
enum MagicAPIResult<Value> {
    case success(Value)
    case error(Error)
}
