import UIKit

class SetTableViewController: UITableViewController {
    private var setTableViewDatasource: SetTableViewDatasource?
    internal lazy var setTableViewDelegate: SetTableViewDelegate = SetTableViewDelegate(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        self.setTableViewDatasource = SetTableViewDatasource(items: MTGSet.mock(), tableView: self.tableView, delegate: self.setTableViewDelegate)
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

extension SetTableViewController: SetViewForHeaderDelegate {
    func viewForHeader(section: Int) -> String {
        return "Set name"
    }
}
