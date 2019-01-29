import UIKit

class SetTableViewController: UITableViewController {
    private var setTableViewDatasource: SetTableViewDatasource?
    internal let setTableViewDelegate: SetTableViewDelegate = SetTableViewDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        self.setTableViewDatasource = SetTableViewDatasource(items: MTGSet.mock(), tableView: self.tableView, delegate: self.setTableViewDelegate)
        self.setTableViewDelegate.setupDelegate(delegate: self.setTableViewDatasource)
        instancePropertySetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func instancePropertySetup() {
        self.tableView.backgroundView = BackgroundView()
        self.tableView.separatorStyle = .none
    }
}
