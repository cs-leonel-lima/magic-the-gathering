//
//  CardSpec.swift
//  magic-the-gathering
//
//  Created by isabel.isaura.l.lima on 18/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import magic_the_gathering

class CardSpec: QuickSpec {
    
    override func spec() {
        describe("Testing Card model with a JSON file") {
            
            var cardsDataMock: Data!
            var falseDataMock: Data!
            
            beforeEach {
                cardsDataMock = JSONHelper.getDataFrom(resource: "cards")
                falseDataMock = JSONHelper.getDataFrom(resource: "sets")
            }
            
            it("Should get an array of Cards from data") {
                if let cards = CardsManager.initializeCardsArray(from: cardsDataMock) {
                    expect(cards).toNot(beNil())
                    expect(cards.count).to(beGreaterThan(0))
                } else {
                    fail("failed to decode data")
                }
            }
            
            it("Should return nil") {
                if let cards = CardsManager.initializeCardsArray(from: falseDataMock) {
                    expect(cards).to(beNil())
                } else {
                    fail("failed to decode data")
                }
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
