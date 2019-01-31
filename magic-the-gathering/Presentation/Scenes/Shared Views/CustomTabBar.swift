import UIKit

class CustomTabBar: UIView {
    
    let horizontalStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    let sets: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sets", for: .normal)
        button.titleLabel?.textColor = .white
        return button
    }()
    
    let favs: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Favorites", for: .normal)
        button.titleLabel?.textColor = .white
        return button
    }()
    
    let middleSeparator: UIView = {
        let view = UIView(frame: .zero)
        view.frame.size = CGSize(width: 1.0, height: 28)
        view.backgroundColor = .white
        return view
    }()
    
    let topSeparator: UIView = {
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
        
//        middleSeparator.snp
    }
    
    func setupAdditionalConfigurations() {
        self.backgroundColor = .clear
    }
    
}
