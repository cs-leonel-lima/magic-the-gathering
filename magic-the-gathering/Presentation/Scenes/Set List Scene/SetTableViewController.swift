import UIKit

class SetTableViewController: UITableViewController {
    private var setTableViewDatasource: SetTableViewDatasource?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        self.setTableViewDatasource = SetTableViewDatasource(items: MTGSet.mock(), tableView: self.tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
