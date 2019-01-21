//
//  SetCell.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class SetCell: UITableViewCell {
    static let identifier = "SetTableCell"
    
    let view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension SetCell: CodeView {
    func buildViewHierarchy() {
        addSubview(self.view1)
        
    }
    
    func setupConstraints() {
        view1.snp.makeConstraints { (make) in
            make.edges.equalTo(self.snp.edges)
            make.height.equalTo(300)
        }
    }
    
    func setupAdditionalConfigurations() {
        
    }
}
