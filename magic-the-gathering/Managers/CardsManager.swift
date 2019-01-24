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
    
    static func categorize(_ cards: [Card]) -> [(String, [Card])] {
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
        
        return cardsCategorized.sorted(by: { return $0.0 < $1.0 })
    }
    
    func searchCards(with text: String) -> [Card] {
        let filteredCards = cards.filter { card in
            return card.name.lowercased().contains(text.lowercased())
        }
        return filteredCards
    }
    
}
