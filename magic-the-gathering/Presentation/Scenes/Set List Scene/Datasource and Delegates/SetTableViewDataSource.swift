import UIKit

class SetTableViewDatasource: NSObject, ItemTableViewDataSource {
    internal var items: [MTGSet]
    internal var tableView: UITableView
    private var service: MagicService?
    internal weak var delegate: UITableViewDelegate?
    
    required init(items: [MTGSet], tableView: UITableView, delegate: UITableViewDelegate) {
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        setupTableView()
        self.tableView.register(cellType: SetTableViewCell.self)
    }
    
    func append(_ set: MTGSet) {
        self.items.append(set)
        self.tableView.reloadData()
    }
    
    func setupContext(_ context: EnviromentContext) {
        switch context {
        case .local:
            self.service = LocalMagicService()
        case .remote:
            self.service = MagicAPIService(operation: URLSessionGetOperation())
        }
    }
    
    func setupData() {
        service?.getSet { result in
            switch result {
            case .success(let set):
                DispatchQueue.main.async {
                    self.append(set)
                }
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SetTableViewCell.self)
        cell.setupData(service: service)
        return cell
    }

}

extension SetTableViewDatasource: SetViewForHeaderDelegate {
    func titleForHeader(in section: Int) -> String {
        return self.items[section].name
    }
}
