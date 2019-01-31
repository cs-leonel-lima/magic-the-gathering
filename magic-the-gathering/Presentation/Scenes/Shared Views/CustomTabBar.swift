import UIKit

class CustomTabBar: UIView {
    
    var delegate: PagingProtocol?
    
    private let horizontalStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private lazy var sets: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sets", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(goToSets), for: .touchUpInside)
        return button
    }()
    
    private lazy var favs: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Favorites", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(goToFavorites), for: .touchUpInside)
        return button
    }()
    
    private let middleSeparator: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    private let topSeparator: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func goToSets() {
        delegate?.goToPreviousPage()
    }
    
    @objc private func goToFavorites() {
        delegate?.goToNextPage()
        
    }
    
}

extension CustomTabBar: CodeView {
    func buildViewHierarchy() {
        horizontalStack.addArrangedSubview(sets)
        horizontalStack.addArrangedSubview(middleSeparator)
        horizontalStack.addArrangedSubview(favs)
        addSubview(middleSeparator)
        addSubview(horizontalStack)
        addSubview(topSeparator)
    }
    
    func setupConstraints() {
        horizontalStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        topSeparator.snp.makeConstraints { make in
            make.top.equalTo(horizontalStack.snp.top)
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalTo(1.0)
            make.centerX.equalToSuperview()
        }
        
        middleSeparator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(1.0)
            make.height.equalTo(25)
            make.centerY.equalTo(horizontalStack.snp.centerY)
        }
    }
    
    func setupAdditionalConfigurations() {
        self.backgroundColor = .clear
    }
    
}
