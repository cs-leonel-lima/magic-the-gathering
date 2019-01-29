import Foundation
import Quick
import Nimble

@testable import magic_the_gathering

class MockDataSource: NSObject, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

class CarouselCollectionViewLayoutSpec: QuickSpec {
    
    override func spec() {
        
        let carouselLayout = CarouselCollectionViewLayout()
        
        describe("CarouselCollectionViewLayout") {
            
            it("has to return the closest cell to the center X of the screen") {
                let attributes = self.mockLayoutAttributes()
                let resultLayout = carouselLayout.layoutAttributesForCentralizingCell(in: attributes, using: 50)
                expect(resultLayout).to(equal(attributes[2]))
            }
            
            it("has to always update layout") {
                let result = carouselLayout.shouldInvalidateLayout(forBoundsChange: .zero)
                expect(result).to(beTrue())
            }
        }
    }
    
    func mockLayoutAttributes() -> [UICollectionViewLayoutAttributes] {
        return [
            createLayoutAttributes(positionedAt: 25, for: 0),
            createLayoutAttributes(positionedAt: 35, for: 1),
            createLayoutAttributes(positionedAt: 60, for: 2)
        ]
    }
    
    func createLayoutAttributes(positionedAt centerX: CGFloat, for item: Int) -> UICollectionViewLayoutAttributes {
        let indexPath = IndexPath(item: item, section: 0)
        let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attr.center = CGPoint(x: centerX, y: 0)
        return attr
    }
}
