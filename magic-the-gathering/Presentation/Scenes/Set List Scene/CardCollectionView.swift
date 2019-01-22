//
//  CollectionView.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class CardCollectionView: UICollectionView {
    var didSelectCard: ((Int) -> Void)?
    var collectionHeightContraint: NSLayoutConstraint?
    var customDataSource: CardsCollectionViewDataSource?
    //swiftlint:disable weak_delegate
    lazy var customDelegate: CardsCollectionViewDelegate = CardsCollectionViewDelegate(delegate: self)
    //swiftlint:enable weak_delegate
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)
        self.customDataSource = CardsCollectionViewDataSource(items: [], collectionView: self, delegate: self.customDelegate)
        self.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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