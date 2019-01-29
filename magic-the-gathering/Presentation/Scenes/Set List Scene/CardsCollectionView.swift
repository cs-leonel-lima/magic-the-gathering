import UIKit

class CardsCollectionView: UICollectionView {
    
    internal var didSelectCard: ((Int) -> Void)?
    
    private var collectionHeightContraint: NSLayoutConstraint?
    
    internal var cardsCollectionViewDataSource: CardsCollectionViewDataSource?
    internal lazy var cardsCollectionViewDelegate: CardsCollectionViewDelegate = CardsCollectionViewDelegate(delegate: self)

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.cardsCollectionViewDataSource = CardsCollectionViewDataSource(items: [], collectionView: self, delegate: self.cardsCollectionViewDelegate)
        self.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateItems(cards: [Card]) {
        self.cardsCollectionViewDataSource?.updateItems(items: cards)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        self.layer.removeAllAnimations()
        
        collectionHeightContraint = self.heightAnchor.constraint(equalToConstant: self.collectionViewLayout.collectionViewContentSize.height)
        self.collectionHeightContraint?.priority = UILayoutPriority(rawValue: 999)
        self.collectionHeightContraint?.isActive = true

        self.updateConstraints()
        self.layoutIfNeeded()
    }
    
}

extension CardsCollectionView: CardsSelectionDelegate {
    func didSelect(indexPath: IndexPath) {
        guard let selectionHandler = self.didSelectCard else { return }
        selectionHandler(indexPath.item)
    }
}
