import UIKit

class SetTableViewDatasource: NSObject, ItemTableViewDataSource {
    internal var items: [SetPresentation]
    internal var filteredItems: [SetPresentation] = []
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
    
    func updateItems(_ setFiltered: [SetPresentation]) {
        filteredItems = setFiltered
        self.tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredItems.isEmpty ? items.count : filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SetTableViewCell.self)
        let setPresentationCards = filteredItems.isEmpty ? items[indexPath.row].cards
            : filteredItems[indexPath.row].cards
        cell.setupData(cards: setPresentationCards)
        return cell
    }

}

extension SetTableViewDatasource: SetViewForHeaderDelegate {
    func titleForHeader(in section: Int) -> String {
        let setPresentationName = filteredItems.isEmpty ? items[section].set.name
            : filteredItems[section].set.name
        return setPresentationName
    }
}
