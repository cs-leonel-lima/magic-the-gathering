//
//  ViewController.swift
//  magic-the-gathering
//
//  Created by leonel.menezes.lima on 17/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class SetTableViewController: UITableViewController {
    private var customDataSource: SetTableViewDatasource?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        self.customDataSource = SetTableViewDatasource(items: MTGSet.mock(), tableView: self.tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
