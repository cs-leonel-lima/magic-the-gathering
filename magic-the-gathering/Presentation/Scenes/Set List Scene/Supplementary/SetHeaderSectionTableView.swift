import UIKit

class SetHeaderSectionTableView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    init(frame: CGRect = .zero, titleForHeader: String?) {
        super.init(frame: frame)
        self.setupView()
        self.titleLabel.text = titleForHeader
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
    
    func setupAdditionalConfigurations() {
        self.backgroundColor = .clear
    }
}
