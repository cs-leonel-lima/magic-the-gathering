import UIKit

class CardsCollectionViewDataSource: NSObject, ItemCollectionViewDataSource {
    
    internal var itemsTuples: [(String, [Card])]
    
    internal var collectionView: UICollectionView
    
    internal weak var delegate: UICollectionViewDelegate?
    
    required init(items: [Card], collectionView: UICollectionView, delegate: UICollectionViewDelegate) {
        self.itemsTuples = CardsManager.categorize(items)
        self.collectionView = collectionView
        self.delegate = delegate
        super.init()
        setupCollectionView()
        collectionView.backgroundColor = .clear
        collectionView.register(cellType: CardCollectionViewCell.self)
        collectionView.register(supplementaryViewType: SetSubHeaderCollectionReusableView.self, ofKind: UICollectionView.elementKindSectionHeader)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return itemsTuples.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsTuples[section].1.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: CardCollectionViewCell.self)
        let card = itemsTuples[indexPath.section].1[indexPath.item]
        cell.setupContent(card: card)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath, viewType: SetSubHeaderCollectionReusableView.self)
            let typeName = itemsTuples[indexPath.section].0
            header.setupContent(categoryTitle: typeName)
            return header
        default:
            break
        }
        
        return UICollectionReusableView()
    }
    
    func updateItems(items: [Card]) {
        self.itemsTuples = CardsManager.categorize(items)
        self.collectionView.reloadData()
    }
}
