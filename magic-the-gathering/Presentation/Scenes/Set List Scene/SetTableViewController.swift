import UIKit

class SetTableViewController: UITableViewController {

    lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.definesPresentationContext = false
        controller.searchBar.sizeToFit()
        controller.searchBar.accessibilityLabel = "searchBar"
        controller.searchBar.accessibilityIdentifier = "searchBar"

        controller.searchBar.placeholder = "search for cards"
        controller.searchBar.tintColor = .white
        controller.searchBar.barStyle = .blackTranslucent
        controller.searchBar.searchBarStyle = .minimal
        controller.searchBar.backgroundColor = .clear

        if let textField = controller.searchBar.value(forKey: "searchField") as? UITextField {
            textField.layer.cornerRadius = 6
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.white.cgColor
        }
        return controller
    }()
    
    private var setTableViewDatasource: SetTableViewDatasource?
    private let context: EnviromentContext
    
    init(style: UITableView.Style, context: EnviromentContext) {
        self.context = context
        super.init(style: style)
    }
    
    internal let setTableViewDelegate: SetTableViewDelegate = SetTableViewDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewDatasource = SetTableViewDatasource(items: MTGSet.mock(), tableView: self.tableView, delegate: self.setTableViewDelegate)
        self.setTableViewDelegate.setupDelegate(delegate: self.setTableViewDatasource)
        self.setTableViewDatasource?.setupContext(self.context)
        self.setTableViewDatasource?.setupData()
        tableViewPropertySetup()
        navigationItem.searchController = searchController

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tableViewPropertySetup() {
        self.tableView.backgroundView = BackgroundView()
        self.tableView.separatorStyle = .none
    }

}
