import UIKit

class CategoryCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseIdentifier, for: indexPath) as? CardCollectionViewCell else {
            fatalError()
        }
        cell.backgroundColor = .clear
        cell.setupContent(card: cards[indexPath.item])
        return cell
    }
    
}
