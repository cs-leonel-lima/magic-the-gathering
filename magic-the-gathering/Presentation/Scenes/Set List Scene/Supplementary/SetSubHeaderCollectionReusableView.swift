import UIKit
import Reusable

class SetSubHeaderCollectionReusableView: UICollectionReusableView, Reusable {
    private let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    func setupContent(categoryTitle: String) {
        self.categoryTitleLabel.text = categoryTitle
    }
}

extension SetSubHeaderCollectionReusableView: CodeView {
    func buildViewHierarchy() {
        addSubview(categoryTitleLabel)
    }
    
    func setupConstraints() {
        categoryTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(10)
            make.top.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurations() {}
    
}
