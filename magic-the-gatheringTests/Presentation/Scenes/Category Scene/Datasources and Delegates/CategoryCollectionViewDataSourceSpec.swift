//
//  CategoryCollectionViewDataSourceSpec.swift
//  magic-the-gatheringTests
//
//  Created by isabel.isaura.l.lima on 24/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import magic_the_gathering

class CategoryCollectionViewDataSourceSpec: QuickSpec {

    override func spec() {
        
        var dataSource: CategoryCollectionViewDataSource!
        var collectionView: CategoryCollectionView!
        
        beforeEach {
            dataSource = CategoryCollectionViewDataSource(cards: JSONHelper.objectFrom(resource: "cards")!)
            collectionView = CategoryCollectionView(frame: .zero, collectionViewLayout: CarouselCollectionViewLayout())
            collectionView.dataSource = dataSource
        }
        
        context("DataSource initialization") {
            it("has a valid datasource") {
                expect(dataSource).toNot(beNil())
            }
        }
        
        context("CollectionView initialized") {
            
            it("has the correct amount of items and sections, according to it's dataSource") {
                let expectedAmount = dataSource.cards.count
                expect(collectionView.numberOfSections).to(equal(1))
                expect(collectionView.numberOfItems(inSection: 0)).to(equal(expectedAmount))
            }
        }
        
    }
    
}
