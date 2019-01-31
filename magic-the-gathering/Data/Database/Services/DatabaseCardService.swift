//
//  DatabaseCardService.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 31/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

class CardDataAccessObject: DataAccessObject<Card> {
    
    func getAll(belongingTo set: MTGSet) -> [Card] {
        let all = getAll()
        return all.filter { $0.mtgCodeSet == set.code }
    }
}

class DatabaseCardService: CardService {
    
    func getCards(of set: MTGSet, _ completion: @escaping (DataResult<[Card]>) -> Void) {
        do {
            let cards = try CardDataAccessObject().getAll(belongingTo: set)
            completion(.success(cards))
        } catch {
            completion(.error(error))
        }
    }
}
