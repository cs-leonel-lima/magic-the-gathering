import UIKit

class CategoryView: UIView {
    
    let categoryCollectionView = CategoryCollectionView(frame: .zero, collectionViewLayout: CarouselCollectionViewLayout())
    
    var interactionDelegate: InteractionDelegate?
    
    private let closeBtn: UIButton = {
        let button = UIButton()
        button.setImage(R.image.close(), for: .normal)
        button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        return button
    }()
    
    private let toggleFavoriteButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
        button.setTitle("add card to deck", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2.5
        button.layer.cornerRadius = 10
        return button
    }()
    
    private var currentIndex: Int = 0
    private var categoryCollectionViewDataSource: CategoryCollectionViewDataSource?
    
    func setupCategoryCollection(with cards: [Card]) {
        setupView()
        categoryCollectionViewDataSource = CategoryCollectionViewDataSource(cards: cards)
        categoryCollectionView.dataSource = categoryCollectionViewDataSource
        categoryCollectionView.delegate = self
    }
    
    func presentFavoriteCardState() {
        toggleFavoriteButton.setTitle("remove card from deck", for: .normal)
    }
    
    func presentNonFavoriteCardState() {
        toggleFavoriteButton.setTitle("add card to deck", for: .normal)
    }
    
    @objc private func dismissSelf() {
        self.interactionDelegate?.dismissViewController()
    }
    
    @objc private func toggleFavorite() {
        self.interactionDelegate?.toggleFavourite(at: currentIndex)
    }
}

extension CategoryView: CodeView {
    func setupAdditionalConfigurations() {}
    
    func buildViewHierarchy() {
        addSubview(categoryCollectionView)
        addSubview(self.closeBtn)
        addSubview(self.toggleFavoriteButton)
    }
    
    func setupConstraints() {
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.categoryCollectionView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.33)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        self.closeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(15)
            make.size.equalTo(CGSize(width: 40, height: 40))
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).inset(15)
        }
        
        self.toggleFavoriteButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
    }
}

extension CategoryView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var closestCell: UICollectionViewCell = categoryCollectionView.visibleCells[0]
        for cell in categoryCollectionView.visibleCells as [UICollectionViewCell] {
            let closestCellDelta = abs(closestCell.center.x - categoryCollectionView.bounds.size.width/2.0 - categoryCollectionView.contentOffset.x)
            let cellDelta = abs(cell.center.x - categoryCollectionView.bounds.size.width/2.0 - categoryCollectionView.contentOffset.x)
            if cellDelta < closestCellDelta {
                closestCell = cell
            }
        }
        guard let indexPath = categoryCollectionView.indexPath(for: closestCell) else { return }
        currentIndex = indexPath.item
        interactionDelegate?.checkFavourite(at: indexPath.item)
    }
}
