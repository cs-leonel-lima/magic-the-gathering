//
//  CardsManagers.swift
//  magic-the-gathering
//
//  Created by isabel.isaura.l.lima on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

class CardsManager {
    
    private var cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func categorize(_ cards: [Card]) -> [String: [Card]] {
        var cardsCategorized: [String: [Card]] = [:]
        
        cards.forEach { card in
            card.types.forEach { type in
                
                if let cardsOfType = cardsCategorized[type] {
                    if !cardsOfType.contains(card) {
                        cardsCategorized[type]?.append(card)
                    }
                } else {
                    cardsCategorized[type] = [card]
                }
            }
        }
        
        return cardsCategorized
    }
    
}
