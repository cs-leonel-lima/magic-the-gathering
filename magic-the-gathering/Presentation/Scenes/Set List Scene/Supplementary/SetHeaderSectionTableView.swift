import UIKit

class SetHeaderSectionTableView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.numberOfLines = 0
        label.text = "Esse é um nome grande para um set"
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SetHeaderSectionTableView: CodeView {
    func buildViewHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { (maker) in
            maker.center.width.height.equalToSuperview()
            maker.leading.equalToSuperview().inset(10)
            maker.trailing.equalToSuperview().offset(10)
        }
    }
    
    func setupAdditionalConfigurations() {}
}
