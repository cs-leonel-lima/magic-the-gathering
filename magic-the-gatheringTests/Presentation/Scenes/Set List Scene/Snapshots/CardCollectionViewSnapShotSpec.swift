import Quick
import Nimble
import Nimble_Snapshots
 @testable import magic_the_gathering

class CardCollectionViewSnapShotSpec: QuickSpec {
    override func spec() {
        var cardCollectionView: CardCollectionView!
        let cards = [Card(id: "1231", name: "QUevedo", types: ["Criatura", "Magia"], imageURL: nil, mtgCodeSet: "ktk"), Card(id: "12312", name: "Tinhoso", types: ["Criatura", "Campo"], imageURL: nil, mtgCodeSet: "ktk")]
        
        beforeEach {
            cardCollectionView = CardCollectionView(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 500)), collectionViewLayout: UICollectionViewFlowLayout())
        }
        
        it("has the expected look and feel") {
            cardCollectionView.updateItems(cards: cards)
            expect(cardCollectionView) == snapshot("Card collection view with generic cells")
        }
    }
}
