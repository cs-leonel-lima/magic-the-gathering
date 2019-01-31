import UIKit

enum ListStatus {
    case filtering
    case loading
    case idle
}

class SetTableViewController: UITableViewController {
    private var setTableViewDatasource: SetTableViewDatasource?
    private let presentationComposer: PresentationComposer
    
    weak var headerTitleDelegate: SetViewForHeaderDelegate?
    
    private var listStatus: ListStatus = .idle {
        didSet {
            switch listStatus {
            case .filtering:
                break
            case .loading:
                break
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tableViewPropertySetup() {
        self.tableView.backgroundView = BackgroundView()
        self.tableView.separatorStyle = .none
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
