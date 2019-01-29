import Foundation
import Quick
import Nimble

@testable import magic_the_gathering

class CardsManagerSpec: QuickSpec {
    
    override func spec() {
        describe("Testing cards manager") {
            
            var cards: [Card]!
            
            beforeEach {
                cards = JSONHelper.objectFrom(resource: "cards")
            }
            
            it("Should initialize a manager given an array of cards") {
                let manager = CardsManager(cards: cards)
                expect(manager).toNot(beNil())
            }
            
            it("Should divide cards by categories") {
                let cardsByCategory = CardsManager.categorize(cards)
                expect(cardsByCategory).toNot(beNil())
            }
            
            it("Should match cards with the search text") {
                let manager = CardsManager(cards: cards)
                let searchExample = manager.searchCards(with: "angel")
                expect(searchExample).toNot(beNil())
            }
            
        }
    }
    
}
