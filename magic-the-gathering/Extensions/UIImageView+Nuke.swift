//
//  UIImageView+Nuke.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 22/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    func download(image url: String) {
        if let imageURL = URL(string: url) {
            Nuke.loadImage(with: imageURL, into: self)
        }
    }
}
