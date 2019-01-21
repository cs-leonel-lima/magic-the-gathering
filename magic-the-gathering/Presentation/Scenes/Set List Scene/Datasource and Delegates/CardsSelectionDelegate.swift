//
//  CardsListCollectionViewDelegate.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

protocol CardsSelectionDelegate: class {
    func didSelect(indexPath: IndexPath)
}
