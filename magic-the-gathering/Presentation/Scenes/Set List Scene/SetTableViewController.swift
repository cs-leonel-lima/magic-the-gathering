import UIKit

class SetTableViewController: UITableViewController {
    private var customDataSource: SetTableViewDatasource?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        self.customDataSource = SetTableViewDatasource(items: MTGSet.mock(), tableView: self.tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
