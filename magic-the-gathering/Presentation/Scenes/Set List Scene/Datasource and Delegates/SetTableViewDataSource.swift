import UIKit

class SetTableViewDatasource: NSObject, ItemTableViewDataSource {
    internal var items: [SetPresentation]
    internal var tableView: UITableView
    internal weak var delegate: UITableViewDelegate?
    
    required init(items: [SetPresentation], tableView: UITableView, delegate: UITableViewDelegate) {
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        setupTableView()
        self.tableView.register(cellType: SetTableViewCell.self)
    }
    
    func append(_ set: SetPresentation) {
        self.items.append(set)
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
        cell.setupData(cards: self.items[indexPath.section].cards)
        return cell
    }

}

extension SetTableViewDatasource: SetViewForHeaderDelegate {
    func titleForHeader(in section: Int) -> String {
        return self.items[section].set.name
    }
}
