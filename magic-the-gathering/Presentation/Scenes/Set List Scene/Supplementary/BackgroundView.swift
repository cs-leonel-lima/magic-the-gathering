import UIKit

class BackgroundView: UIView {
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = R.image.background()
        return imageView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BackgroundView: CodeView {
    func buildViewHierarchy() {
        addSubview(backgroundImage)
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { (maker) in
            maker.center.width.height.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurations() {}
}
