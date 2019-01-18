//
//  ReusableCodeView.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 18/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

protocol ReusableCodeView: AnyObject, CodeView {
    var needsSetup: Bool {get set}
}

extension ReusableCodeView {
    func setupView() {
        if needsSetup {
            buildViewHierarchy()
            setupConstraints()
            setupAdditionalConfigurations()
            needsSetup.toggle()
        }
    }
}
