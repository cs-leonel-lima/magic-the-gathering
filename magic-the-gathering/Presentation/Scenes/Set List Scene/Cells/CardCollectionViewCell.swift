import UIKit
import Nuke
import Reusable

class CardCollectionViewCell: UICollectionViewCell, Reusable {
    
    private let cardImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        view.layer.cornerRadius = 15.0
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupContent(card: Card) {
        if let url = card.imageURL {
            self.cardImage.download(image: url)
        } else {
            self.cardImage.image = R.image.placeholder()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cardImage.image = nil
    }
}

extension CardCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(cardImage)
    }
    
    func setupConstraints() {
        cardImage.snp.makeConstraints { (make) in
            make.edges.equalTo(self.snp.edges)
            make.center.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurations() {
        self.backgroundColor = .clear
    }
    
}
