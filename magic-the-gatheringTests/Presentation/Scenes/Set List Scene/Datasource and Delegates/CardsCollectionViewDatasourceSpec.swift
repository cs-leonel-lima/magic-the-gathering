import Quick
import Nimble
@testable import magic_the_gathering

class CardsCollectionViewDatasourceSpec: QuickSpec {
    override func spec() {
            
            var dataSource: CardsCollectionViewDataSource!
            
            var collectionView: UICollectionView!
            
            beforeEach {
                collectionView = UICollectionView(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 500)), collectionViewLayout: UICollectionViewLayout())
                let cards: [Card] = JSONHelper.objectFrom(resource: "cards")!
                dataSource = CardsCollectionViewDataSource(items: cards, collectionView: collectionView, delegate: CollectionViewDelegateMock())
            }
            
            it("does have a valid datasource", closure: {
                expect(dataSource).toNot(beNil())
            })
            
//            it("does have the expected amount of sections and items", closure: {
//                expect(collectionView.numberOfSections).to(equal(4))
//                expect(collectionView.numberOfItems(inSection: 0)).to(equal(41))      
//            })
            
            it("does return the expected kind of cell", closure: {
                let cell = dataSource.collectionView(collectionView, cellForItemAt: IndexPath(item: 0, section: 0))
                expect(cell).toNot(beNil())
                expect(cell).to(beAKindOf(CardCollectionViewCell.self))
            })
            
        }
}

