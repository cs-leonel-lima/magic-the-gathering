//
//  CategoryViewController.swift
//  magic-the-gathering
//
//  Created by isabel.isaura.l.lima on 22/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    private var categoryView = CategoryView()
    var categoryCards: [Card] = []
    
    override func loadView() {
        super.loadView()
        view = categoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryView.setupCategoryCollection(with: categoryCards)
    }
}
