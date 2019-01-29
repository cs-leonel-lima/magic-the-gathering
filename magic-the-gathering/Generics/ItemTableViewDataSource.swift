import UIKit

protocol ItemTableViewDataSource: UITableViewDataSource {
    associatedtype SetType
    var items: [SetType] { get }
    var tableView: UITableView { get }
    var delegate: UITableViewDelegate? { get }
    
    init(items: [SetType], tableView: UITableView, delegate: UITableViewDelegate)
}

extension ItemTableViewDataSource {
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self.delegate
        self.tableView.reloadData()
    }
}
