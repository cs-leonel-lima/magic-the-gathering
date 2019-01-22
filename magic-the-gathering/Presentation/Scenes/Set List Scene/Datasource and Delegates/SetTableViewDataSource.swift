//
//  SetTableViewDataSource.swift
//  magic-the-gathering
//
//  Created by leonel.menezes.lima on 22/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class SetTableViewDatasource: NSObject, ItemTableViewDataSource {
    var items: [MTGSet]
    
    var tableView: UITableView?
    
    weak var delegate: UITableViewDelegate?
    
    required init(items: [MTGSet], tableView: UITableView, delegate: UITableViewDelegate) {
        self.items = items
        super.init()
        self.tableView = tableView
        self.delegate = delegate
        setupTableView()
        self.tableView?.register(SetTableViewCell.self, forCellReuseIdentifier: SetTableViewCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SetTableViewCell.identifier) as? SetTableViewCell else {
            return SetTableViewCell()
        }
        
        return cell
    }
    
}
