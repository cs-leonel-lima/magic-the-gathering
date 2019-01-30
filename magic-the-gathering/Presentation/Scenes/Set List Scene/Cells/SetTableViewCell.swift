import UIKit
import Reusable

class SetTableViewCell: UITableViewCell, Reusable {
    
    private let mtgSetCollectionView: CardsCollectionView = {
        let collectionView = CardsCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(cards: [Card]) {
        self.mtgSetCollectionView.updateItems(cards: cards)
        self.setupLayout()
    }
}

extension SetTableViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(self.mtgSetCollectionView)
        
    }
    
    func setupConstraints() {
        mtgSetCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurations() {
        self.backgroundColor = .clear
    }
    
    func setupLayout() {
        self.contentView.frame.size.height = self.mtgSetCollectionView.contentSize.height
        self.layoutIfNeeded()
        self.mtgSetCollectionView.collectionViewLayout.invalidateLayout()
    }
    
}
