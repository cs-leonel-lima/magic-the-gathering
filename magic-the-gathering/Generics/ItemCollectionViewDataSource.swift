import UIKit

protocol ItemCollectionViewDataSource: UICollectionViewDataSource {
    associatedtype CardType
    var itemsTuples: [(String, [Card])] { get }
    var collectionView: UICollectionView { get }
    var delegate: UICollectionViewDelegate? { get }
    
    init(items: [CardType], collectionView: UICollectionView,
         delegate: UICollectionViewDelegate)
}

extension ItemCollectionViewDataSource {
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self.delegate
        self.collectionView.reloadData()
    }
}
