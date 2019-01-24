//
//  CollectionView.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class CardCollectionView: UICollectionView {
    internal var didSelectCard: ((Int) -> Void)?
    private var collectionHeightContraint: NSLayoutConstraint?
    internal var customDataSource: CardsCollectionViewDataSource?
    internal lazy var cardsCollectionViewDelegate: CardsCollectionViewDelegate = CardsCollectionViewDelegate(delegate: self)
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.customDataSource = CardsCollectionViewDataSource(items: [], collectionView: self, delegate: self.cardsCollectionViewDelegate)
        self.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateItems(cards: [Card]) {
        self.customDataSource?.updateItems(items: cards)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        self.layer.removeAllAnimations()
        
        collectionHeightContraint = self.heightAnchor.constraint(equalToConstant: self.collectionViewLayout.collectionViewContentSize.height)
        self.collectionHeightContraint?.priority = UILayoutPriority(rawValue: 999)
        self.collectionHeightContraint?.isActive = true

        self.updateConstraints()
        self.layoutIfNeeded()
    }
    
}

extension CardCollectionView: CardsSelectionDelegate {
    func didSelect(indexPath: IndexPath) {
        guard let selectionHandler = self.didSelectCard else { return }
        selectionHandler(indexPath.item)
    }
}
