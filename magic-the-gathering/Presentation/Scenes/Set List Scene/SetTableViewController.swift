import UIKit

class SetTableViewController: UITableViewController {
    private var setTableViewDatasource: SetTableViewDatasource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(style: UITableView.Style, context: EnviromentContext) {
        super.init(style: style)
        self.setTableViewDatasource = SetTableViewDatasource(items: [], tableView: self.tableView)
        self.setTableViewDatasource?.setupContext(context)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
