import UIKit

class SetTableViewController: UITableViewController {
    private var setTableViewDatasource: SetTableViewDatasource?
    private let context: EnviromentContext
    
    init(style: UITableView.Style, context: EnviromentContext) {
        self.context = context
        super.init(style: style)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewDatasource = SetTableViewDatasource(items: [], tableView: self.tableView)
        self.setTableViewDatasource?.setupContext(self.context)
        self.setTableViewDatasource?.setupData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
