//
//  CategoryViewSpec.swift
//  magic-the-gatheringTests
//
//  Created by isabel.isaura.l.lima on 28/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import magic_the_gathering

class CategoryViewSpec: QuickSpec {
    
    override func spec() {
        
        describe("CategoryView") {
            
            var cardMock: [Card]!
            var collectionView: CategoryCollectionView!
            let view = CategoryView(frame: .zero)
            
            beforeEach {
                cardMock = JSONHelper.objectFrom(resource: "cards")!
                collectionView = CategoryCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                view.addSubview(collectionView)
            }
            
            context("Category CollectionView DataSource update") {
                
                beforeEach {
                    view.setupCategoryCollection(with: cardMock)
                }
                
                it("has the datasource updated with the given cards") {
                    guard let dataSource = view.categoryCollectionView.dataSource as? CategoryCollectionViewDataSource else {
                        fail()
                        return
                    }
                    expect(dataSource.cards.count).to(equal(cardMock.count))
                }
            }
            
            
        }
    }
    
}
