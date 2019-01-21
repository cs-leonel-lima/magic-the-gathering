//
//  CardsManagerSpec.swift
//  magic-the-gatheringTests
//
//  Created by isabel.isaura.l.lima on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import magic_the_gathering

class CardsManagerSpec: QuickSpec {
    
    override func spec() {
        describe("Testing cards manager") {
            
            var cardsDataMock: Data?
            
            beforeEach {
                cardsDataMock = JSONHelper.getDataFrom(resource: "cards")
            }
            
            it("Should initialize a manager given an array of cards") {
                if let data = cardsDataMock, let cards = Card.initializeCardsArray(from: data) {
                    let manager = CardsManager(cards: cards)
                    expect(manager).toNot(beNil())
                }
            }
            
            it("Should divide cards by categories") {
                if let data = cardsDataMock, let cards = Card.initializeCardsArray(from: data) {
                    let manager = CardsManager(cards: cards)
                    let cardsByCategory = manager.categorize(cards)
                    expect(cardsByCategory).toNot(beNil())
                }
                
            }
        }
    }

}
