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
