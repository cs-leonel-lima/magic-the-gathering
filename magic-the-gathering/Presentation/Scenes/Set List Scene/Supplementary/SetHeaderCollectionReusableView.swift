//
//  SetCustomHeader.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 22/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class SetHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "SetCustomHeader"
    
    let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init do not apllied")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    func setupContent(categoryTitle: String) {
        self.categoryTitleLabel.text = categoryTitle
    }
}

extension SetHeaderCollectionReusableView: CodeView {
    func buildViewHierarchy() {
        addSubview(categoryTitleLabel)
    }
    
    func setupConstraints() {
        categoryTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(10)
            make.top.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurations() {}
    
}
