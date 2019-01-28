//
//  CategoryCollectionViewDataSource.swift
//  magic-the-gathering
//
//  Created by isabel.isaura.l.lima on 22/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class CategoryCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
}
