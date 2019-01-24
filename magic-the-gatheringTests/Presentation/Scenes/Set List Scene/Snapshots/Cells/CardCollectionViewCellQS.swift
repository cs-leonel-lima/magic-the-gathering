//
//  CardCollectionViewCell.swift
//  magic-the-gatheringTests
//
//  Created by adann.sergio.simoes on 23/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import magic_the_gathering

class CardCollectionViewCellQS: QuickSpec {
    override func spec() {
        describe("The 'UI' of the CardCollectionViewCell") {
            it("should have the expected look and feel") {
                let frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 500))
                let cardCell = CardCollectionViewCell(frame: frame)
                let card = Card(id: "001AB", name: "Padre Quevedo", types: ["Priest"], imageURL: nil, mtgCodeSet: "PRE")
                cardCell.setupContent(card: card)
                expect(cardCell) == snapshot("CardCollectionViewCell")
            }
        }
    }
}
