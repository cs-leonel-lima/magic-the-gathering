//
//  Cat.swift
//  magic-the-gatheringTests
//
//  Created by isabel.isaura.l.lima on 28/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import magic_the_gathering

class CategoryCollectionViewSnapshot: QuickSpec {
    
    override func spec() {
        let cardMock = Card.mock()
        var collectionView: CategoryCollectionView!
        let dataSource = CategoryCollectionViewDataSource(cards: cardMock)
        let rootViewController = UIViewController(nibName: nil, bundle: nil)
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        beforeEach {
            let collectionFrame = CGRect(origin: .zero, size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.33))
            collectionView = CategoryCollectionView(frame: collectionFrame, collectionViewLayout: CarouselCollectionViewLayout())
            collectionView.dataSource = dataSource
            rootViewController.view.addSubview(collectionView)
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
        }
        
        describe("Carousel Collection View Layout") {
            context("showing first cell") {
                it("has the expected centralized layout") {
                    expect(rootViewController.view) == snapshot("CategoryCollectionViewAtFirstItem")
                }
            }
            
            context("showing mid cell") {
                beforeEach {
                    let middleIndexPath = IndexPath(item: 4, section: 0)
                    collectionView.scrollToItem(at: middleIndexPath, at: .centeredHorizontally, animated: false)
                }
                it("has the expected centralized layout") {
                    expect(rootViewController.view) == snapshot("CategoryCollectionViewAtMiddleItem")
                }
            }
            
            context("showing last cell") {
                beforeEach {
                    let lastIndexPath = IndexPath(item: cardMock.count - 1, section: 0)
                    collectionView.scrollToItem(at: lastIndexPath, at: .centeredHorizontally, animated: false)
                }
                it("has the expected centralized layout") {
                    expect(rootViewController.view) == snapshot("CategoryCollectionViewAtLastItem")
                }
            }

        }
    }
}
