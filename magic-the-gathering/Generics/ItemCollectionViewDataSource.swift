//
//  ItemCollectionViewDataSource.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

protocol ItemCollectionViewDataSource: UICollectionViewDataSource {
    associatedtype CardType
    var itemsTuples: [(String, [Card])] { get }
    var collectionView: UICollectionView { get }
    var delegate: UICollectionViewDelegate? { get }
    
    init(items: [CardType], collectionView: UICollectionView,
         delegate: UICollectionViewDelegate)
}

extension ItemCollectionViewDataSource {
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self.delegate
        self.collectionView.reloadData()
    }
}
