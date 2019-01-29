import Foundation
import UIKit

class CarouselCollectionViewLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        scrollDirection = .horizontal
        guard let collectionView = collectionView else { return }
        itemSize = CGSize(width: UIScreen.main.bounds.width * 0.42, height: collectionView.bounds.height)
        let insetX = (collectionView.bounds.width - itemSize.width) / 2.0
        sectionInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
    }
    
    // Returns layout attributes for the cells that could be visible on scroll
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let layoutAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
        return layoutAttributes.map { changeLayoutAttributes($0) }
    }
    
    // We require the layout of the collection view to change upon scroll so return true
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // Customize the attributes of the visible cells
    func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        guard let collectionView = collectionView else { fatalError("Category Collection View found nil") }
        let collectionCenter = collectionView.frame.size.width / 2
        attributes.transform3D = scale(using: collectionCenter, and: attributes)
        return attributes
    }
    
    func scale(using collectionCenter: CGFloat,
               and layoutAttributes: UICollectionViewLayoutAttributes) -> CATransform3D {
        
        let standardItemHeightScale = 0.87
        let standardItemWidthScale = 0.95
        
        guard let collectionView = collectionView else { fatalError("Category Collection View found nil")}
        let offset = collectionView.contentOffset.x
        let normalizedCenter = layoutAttributes.center.x - offset
        
        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
        let ratio = (maxDistance - distance) / maxDistance
        let scaleHeight = (ratio * CGFloat(1 - standardItemHeightScale) + CGFloat(standardItemHeightScale))
        let scaleWidth = (ratio * CGFloat(1 - standardItemWidthScale) + CGFloat(standardItemWidthScale))
        
        return CATransform3DScale(CATransform3DIdentity, scaleWidth, scaleHeight, 1.0)
    }
    
    // Change the scrolling behavior of the CollectionView to always stop at the center
    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionViewBounds = self.collectionView?.bounds else { return .zero }
        let collectionViewHalfWidth = collectionViewBounds.size.width * 0.5
        let proposedContentOffsetCenterX = proposedContentOffset.x + collectionViewHalfWidth
        
        guard let attributesForVisibleCells = self.layoutAttributesForElements(in: collectionViewBounds) else {
            return .zero
        }
        let centralizingCellAttributes = layoutAttributesForCentralizingCell(in: attributesForVisibleCells,
                                                                             using: proposedContentOffsetCenterX)
        
        return CGPoint(x: centralizingCellAttributes.center.x - collectionViewHalfWidth, y: proposedContentOffset.y)
    }
    
    // Decide wich cell to centralize based on offset
    func layoutAttributesForCentralizingCell(
        in visibleCellsAttributes: [UICollectionViewLayoutAttributes],
        using proposedCenterXOffset: CGFloat) -> UICollectionViewLayoutAttributes {
        
        // safe because visibleCellAttributes will never be empty
        var candidateCellLayoutAttributes: UICollectionViewLayoutAttributes!
        
        for attributes in visibleCellsAttributes {
            guard let candAttr = candidateCellLayoutAttributes else {
                candidateCellLayoutAttributes = attributes
                continue
            }
            
            let currentCellDistanceFromCenter = abs(attributes.center.x - proposedCenterXOffset)
            let previousCellDistanceFromCenter = abs(candAttr.center.x - proposedCenterXOffset)
            
            if currentCellDistanceFromCenter < previousCellDistanceFromCenter {
                candidateCellLayoutAttributes = attributes
            }
        }
        
        return candidateCellLayoutAttributes
    }
}
