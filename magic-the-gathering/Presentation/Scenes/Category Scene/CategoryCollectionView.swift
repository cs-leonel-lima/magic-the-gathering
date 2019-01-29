import UIKit

class CategoryCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        isScrollEnabled = true
        isPagingEnabled = false
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        accessibilityIdentifier = "CategoryCollectionView"
        accessibilityLabel = "CategoryCollectionView"
    }
}
