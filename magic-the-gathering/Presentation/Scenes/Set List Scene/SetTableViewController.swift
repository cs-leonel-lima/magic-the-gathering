import UIKit

class SetTableViewController: UITableViewController {
    private var setTableViewDatasource: SetTableViewDatasource?
    let service: MTGSetsService

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(style: UITableView.Style, service: MTGSetsService) {
        self.service = service
        super.init(style: style)
        
        service.getSets { result in
            switch result {
            case .success(let sets):
                self.setTableViewDatasource?.updateItems(sets: sets)
            case .error(let error):
                print(error.localizedDescription)
            }
        }
        
        self.setTableViewDatasource = SetTableViewDatasource(items: [], tableView: self.tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
