import UIKit

class SetTableViewDatasource: NSObject, ItemTableViewDataSource {
    internal var items: [MTGSet]
    internal var tableView: UITableView
    
    required init(items: [MTGSet], tableView: UITableView) {
        self.items = items
        self.tableView = tableView
        super.init()
        setupTableView()
        self.tableView.register(cellType: SetTableViewCell.self)
    }
    
    func updateItems(sets: [MTGSet]) {
        self.items = sets
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SetTableViewCell.self)
        return cell
    }
    
}
