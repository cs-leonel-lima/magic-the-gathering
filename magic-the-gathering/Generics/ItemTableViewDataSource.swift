//
//  ItemTableViewDataSource.swift
//  magic-the-gathering
//
//  Created by adann.sergio.simoes on 21/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

protocol ItemTableViewDataSource: UITableViewDataSource {
    //swiftlint:disable type_name
    associatedtype T
    //swiftlint:enable type_name
    var items: [T] { get }
    var tableView: UITableView { get }
    
    init(items: [T], tableView: UITableView)
}

extension ItemTableViewDataSource {
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
}
