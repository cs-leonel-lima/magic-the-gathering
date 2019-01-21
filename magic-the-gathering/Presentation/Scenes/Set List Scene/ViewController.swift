//
//  ViewController.swift
//  magic-the-gathering
//
//  Created by leonel.menezes.lima on 17/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = CGFloat(50)
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(SetTableViewCell.self, forCellReuseIdentifier: SetTableViewCell.identifier)
    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SetTableViewCell.identifier) as? SetTableViewCell else {
            return SetTableViewCell(frame: .zero)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
