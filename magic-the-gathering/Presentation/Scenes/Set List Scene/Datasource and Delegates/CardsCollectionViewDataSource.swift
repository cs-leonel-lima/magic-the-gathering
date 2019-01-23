//
//  CardsCollectionViewDataSource.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class CardsCollectionViewDataSource: NSObject, ItemCollectionViewDataSource {
    
    var itemsDictionary: [String: [Card]]
    
    var collectionView: UICollectionView?
    
    weak var delegate: UICollectionViewDelegate?
    
    required init(items: [Card], collectionView: UICollectionView, delegate: UICollectionViewDelegate) {
        self.itemsDictionary = CardsManager.categorize(items)
        self.collectionView = collectionView
        self.delegate = delegate
        super.init()
        setupCollectionView()
        collectionView.register(CardCollectionViewCell.self,
                                forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        collectionView.register(SetCustomHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SetCustomHeader.identifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return itemsDictionary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsDictionary[Array(itemsDictionary.keys).sorted()[section]]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell
        else {
            fatalError("Could not dequeue cell")
        }
        if let cardsContainer = itemsDictionary[Array(itemsDictionary.keys).sorted()[indexPath.section]] {
            let card = cardsContainer[indexPath.item]
            
            if let url = card.imageURL {
                cell.setupContent(imageURL: url)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
                SetCustomHeader.identifier, for: indexPath) as? SetCustomHeader else {
                    break
            }
            //TODO: get the correct type/category name
            
            let typeName = Array(itemsDictionary.keys).sorted()[indexPath.section].description
            header.setupContent(categoryTitle: typeName)
            return header
        default:
            break
        }
        
        return UICollectionReusableView()
    }
    
    func updateItems(items: [Card]) {
        self.itemsDictionary = CardsManager.categorize(items)
        self.collectionView?.reloadData()
    }
}
