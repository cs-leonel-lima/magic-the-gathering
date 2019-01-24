//
//  SetCell.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class SetTableViewCell: UITableViewCell {
    static let identifier = "SetTableViewCell"
    
    let mtgSetCollectionView: CardCollectionView = {
        let collectionView = CardCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
        guard let cardsData = JSONHelper.getDataFrom(resource: "cards"), let cards = Card.initializeCardsArray(from: cardsData) else {
            return
        }
        self.mtgSetCollectionView.updateItems(cards: cards)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SetTableViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(self.mtgSetCollectionView)
        
    }
    
    func setupConstraints() {
        mtgSetCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurations() {}
    
    func setupLayout() {
        self.contentView.frame.size.height = self.mtgSetCollectionView.contentSize.height
        self.layoutIfNeeded()
        self.mtgSetCollectionView.collectionViewLayout.invalidateLayout()
    }
}
