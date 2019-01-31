import UIKit

class SetTableViewController: UITableViewController {

    lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchResultsUpdater = self
        controller.definesPresentationContext = false
        
        searchBarPropertySetup(searchBar: controller.searchBar)
        
        guard let textField = controller.searchBar.value(forKey: "searchField") as? UITextField else { return controller}
        textFieldPropertySetup(textField: textField)
        
        return controller
    }()
    
    private var setTableViewDatasource: SetTableViewDatasource?
    private let presentationComposer: PresentationComposer
    
    weak var headerTitleDelegate: SetViewForHeaderDelegate?
    
    init(style: UITableView.Style, presentationComposer: PresentationComposer) {
        self.presentationComposer = presentationComposer
        super.init(style: style)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewDatasource = SetTableViewDatasource(items: [], tableView: self.tableView, delegate: self)
        setupDelegate(delegate: self.setTableViewDatasource)
        tableViewPropertySetup()
        presentationComposer.getSetPresentation { [weak self] (result) in
            switch result {
            case .success(let setPresentation):
                DispatchQueue.main.async {
                    self?.setTableViewDatasource?.append(setPresentation)
                }
            case .error(let error):
                print(error.localizedDescription)
            }
        }
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
    
    private func searchBarPropertySetup(searchBar: UISearchBar) {
        searchBar.accessibilityLabel = "searchBar"
        searchBar.accessibilityIdentifier = "searchBar"
        
        searchBar.sizeToFit()
        searchBar.placeholder = "search for cards"
        searchBar.tintColor = .white
        searchBar.barStyle = .blackTranslucent
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = .clear
    }
    
    private func textFieldPropertySetup(textField: UITextField) {
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
    }

}

extension SetTableViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleHeader = self.headerTitleDelegate?.titleForHeader(in: section)
        let headerView = SetHeaderSectionTableView(titleForHeader: titleHeader)
        return headerView
    }
    
    func setupDelegate(delegate: SetViewForHeaderDelegate?) {
        self.headerTitleDelegate = delegate
    }
}

extension SetTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let inputedText = searchController.searchBar.text else { return }
        filterContentForSearchText(inputedText)
    }
    
    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        // code here
    }
}
