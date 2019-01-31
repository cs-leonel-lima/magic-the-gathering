import Foundation

class CardsManager {
    
    private let dao: CardDataAccessObject
    private var cards: [Card]
    
    init(cards: [Card]) throws {
        self.cards = cards
        dao = try CardDataAccessObject()
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
    
    func favorite(card: Card) throws {
        try dao.create(object: card)
    }
    
    func unfavorite(card: Card) throws {
        try dao.delete(object: card)
    }
    
    func isFavorite(card: Card) throws -> Bool {
        return try dao.contains(object: card)
    }

    func searchCards(with text: String) -> [Card] {
        let filteredCards = cards.filter { card in
            return card.name.lowercased().contains(text.lowercased())
        }
        return filteredCards
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
