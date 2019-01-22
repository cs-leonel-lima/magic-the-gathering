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
    
    let MTGSetCollectionView: CardCollectionView = {
        let collectionView = CardCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .blue
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        self.MTGSetCollectionView.updateItems(cards: Card.mock())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension SetTableViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(self.MTGSetCollectionView)
        
    }
    
    func setupConstraints() {
        MTGSetCollectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.snp.edges)
            make.height.equalTo(MTGSetCollectionView.snp.height)
        }
    }
    
    func setupAdditionalConfigurations() {
        
    }
}
