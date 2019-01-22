//
//  CardCollectionViewCell.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit
import Nuke

class CardCollectionViewCell: UICollectionViewCell {
    static let identifier = "CardCollectionViewCell"
    
    let cardImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.layer.masksToBounds = true
        //TODO: Implementar uma lista de corner radius pra cada device
        view.layer.cornerRadius = UIScreen.main.bounds.height / 25
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    func setupContent(imageURL: String) {
        self.cardImage.download(image: imageURL)
    }
}

extension CardCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(cardImage)
    }
    
    func setupConstraints() {
        cardImage.snp.makeConstraints { (make) in
            make.edges.equalTo(self.snp.edges)
            make.center.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurations() {}
    
}
