//
//  CardCollectionViewCell.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    static let identifier = "CardCollectionViewCell"
    
    let view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
}

extension CardCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(view1)
    }
    
    func setupConstraints() {
        view1.snp.makeConstraints { (make) in
            make.edges.equalTo(self.snp.edges)
        }
    }
    
    func setupAdditionalConfigurations() {}
    
}
