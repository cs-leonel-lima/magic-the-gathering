import Foundation
import Quick
import Nimble

@testable import magic_the_gathering

class CardsManagerSpec: QuickSpec {
    
    override func spec() {
        describe("Testing cards manager") {
            
            var cardsDataMock: Data!
            
            beforeEach {
                cardsDataMock = JSONHelper.getDataFrom(resource: "cards")
            }
            
            it("Should initialize a manager given an array of cards") {
                if let data = cardsDataMock, let cards = CardsManager.initializeCardsArray(from: data) {
                    let manager = CardsManager(cards: cards)
                    expect(manager).toNot(beNil())
                } else {
                    fail("Could not initialize manager")
                }
            }
            
            it("Should divide cards by categories") {
                if let cards = CardsManager.initializeCardsArray(from: cardsDataMock) {
                    let cardsByCategory = CardsManager.categorize(cards)
                    expect(cardsByCategory).toNot(beNil())
                } else {
                    fail("failed do decode data")
                }
            }
            
            it("Should match cards with the search text") {
                if let cards = CardsManager.initializeCardsArray(from: cardsDataMock) {
                    let manager = CardsManager(cards: cards)
                    let searchExample = manager.searchCards(with: "angel")
                    expect(searchExample).toNot(beNil())
                } else {
                    fail("failed do decode data")
                }
            }
            
        }
    }

}
