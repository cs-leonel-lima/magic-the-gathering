//
//  ItemTableViewDataSource.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

protocol ItemTableViewDataSource: UITableViewDataSource {
    associatedtype SetType
    var items: [SetType] { get }
    var tableView: UITableView { get }
    
    init(items: [SetType], tableView: UITableView)
}

extension ItemTableViewDataSource {
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
}
