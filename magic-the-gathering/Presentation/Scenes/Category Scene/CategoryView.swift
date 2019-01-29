import UIKit

class CategoryView: UIView {
    
    let categoryCollectionView = CategoryCollectionView(frame: .zero, collectionViewLayout: CarouselCollectionViewLayout())
    private var categoryCollectionViewDataSource: CategoryCollectionViewDataSource?
    
    func setupCategoryCollection(with cards: [Card]) {
        setupView()
        categoryCollectionViewDataSource = CategoryCollectionViewDataSource(cards: cards)
        categoryCollectionView.dataSource = categoryCollectionViewDataSource
    }
}

extension CategoryView: CodeView {
    func setupAdditionalConfigurations() {}
    
    func buildViewHierarchy() {
        addSubview(categoryCollectionView)
    }
    
    func setupConstraints() {
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                categoryCollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                categoryCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.33, constant: 0),
                categoryCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
                categoryCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor)
            ]
        )
    }
}
