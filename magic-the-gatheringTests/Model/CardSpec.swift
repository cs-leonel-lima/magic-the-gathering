import Foundation
import Quick
import Nimble

@testable import magic_the_gathering

class CardSpec: QuickSpec {
    
    override func spec() {
        describe("Testing Card model with a JSON file") {
            
            var cardsDataMock: [Card]!
            
            beforeEach {
                cardsDataMock = JSONHelper.objectFrom(resource: "cards")
            }
            
            it("Should get an array of Cards from data") {
                expect(cardsDataMock).toNot(beNil())
                expect(cardsDataMock.count).to(beGreaterThan(0))
            }
            
            context("Comparing cards") {
                it("Should match two cards based on their names") {
                    let card1 = Card(id: "0", name: "Card", types: [], imageURL: "", mtgCodeSet: "")
                    let card2 = Card(id: "1", name: "Card", types: ["creature"], imageURL: "", mtgCodeSet: "")
                    expect(card1).to(equal(card2))
                }
                
                it("Shouldn't match cards with different names") {
                    let card1 = Card(id: "0", name: "Card", types: [], imageURL: "", mtgCodeSet: "")
                    let card2 = Card(id: "1", name: "Cord", types: ["creature"], imageURL: "", mtgCodeSet: "")
                    expect(card1).toNot(equal(card2))
                }
            }
            
        }
    }
    
}
