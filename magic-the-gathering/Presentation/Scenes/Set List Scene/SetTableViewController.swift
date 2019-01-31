import UIKit

enum ListStatus {
    case filtering
    case loading
    case idle
}

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
    private var filteredSetPresentation: [SetPresentation] = [] {
        didSet {
            switch isFiltering() {
            case true:
                listStatus = .filtering
            case false:
                listStatus = .idle
            }
        }
    }
    
    weak var headerTitleDelegate: SetViewForHeaderDelegate?
    
    private var listStatus: ListStatus = .idle {
        didSet {
            switch listStatus {
            case .filtering:
                break
            case .loading:
                getNextBatch()
            case .idle:
                break
            }
        }
    }
    
    init(style: UITableView.Style, presentationComposer: PresentationComposer) {
        self.presentationComposer = presentationComposer
        super.init(style: style)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewDatasource = SetTableViewDatasource(items: [], tableView: self.tableView, delegate: self)
        setupDelegate(delegate: self.setTableViewDatasource)
        tableViewPropertySetup()
        self.listStatus = .loading
    }
    
    private func getNextBatch() {
        presentationComposer.getSetPresentation { [weak self] (result) in
            switch result {
            case .success(let setPresentation):
                DispatchQueue.main.async {
                    self?.setTableViewDatasource?.append(setPresentation)
                    self?.listStatus = .idle
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
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard isPageAtTheEnd(indexPath) && listStatus != .loading else { return }
        self.listStatus = .loading
    }
    
    private func isPageAtTheEnd(_ indexPath: IndexPath) -> Bool {
        guard let items = self.setTableViewDatasource?.items else { return false }
        return indexPath.section == items.count  - 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height/2
    }
    
    func setupDelegate(delegate: SetViewForHeaderDelegate?) {
        self.headerTitleDelegate = delegate
    }
}

extension SetTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredSetPresentation.removeAll()
        if isFiltering() {
            setTableViewDatasource?.items.forEach { setPresetantion in
                let cards = setPresetantion.cards
                let filteredCards = CardsManager.searchCards(with: searchText, on: cards)
                
                guard filteredCards != [] else { return }
                filteredSetPresentation.append(SetPresentation(set: setPresetantion.set, cards: filteredCards))
                
                setTableViewDatasource?.updateItems(filteredSetPresentation)
                
            }
        } else {
            setTableViewDatasource?.updateItems(filteredSetPresentation)
        }
    }
}
