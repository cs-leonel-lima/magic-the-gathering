import UIKit

class CardsCollectionView: UICollectionView {
    
    internal var didSelectCard: ((IndexPath) -> Void)?
    
    private var collectionHeightContraint: NSLayoutConstraint?
    
    internal var cardsCollectionViewDataSource: CardsCollectionViewDataSource?
    internal lazy var cardsCollectionViewDelegate: CardsCollectionViewDelegate = CardsCollectionViewDelegate(delegate: self)

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.cardsCollectionViewDataSource = CardsCollectionViewDataSource(items: [], collectionView: self, delegate: self.cardsCollectionViewDelegate)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateItems(cards: [Card]) {
        self.cardsCollectionViewDataSource?.updateItems(items: cards)
    }
    
}

extension CardsCollectionView: CardsSelectionDelegate {
    func didSelect(indexPath: IndexPath) {
        guard let selectionHandler = self.didSelectCard else { return }
        selectionHandler(indexPath)
    }
}
