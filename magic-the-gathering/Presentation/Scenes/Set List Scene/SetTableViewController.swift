import UIKit

protocol PopulateSetsProtocol {
    func getNextSet(handler: @escaping (MTGSet) -> Void)
}

protocol PopulateCardsProtocol {
    func getCardsFromPool(handler: @escaping ([Card]) -> Void)
}

typealias PopulateUIProtocol = (PopulateSetsProtocol & PopulateCardsProtocol)

class SetTableViewController: UITableViewController {
    private var setTableViewDatasource: SetTableViewDatasource?
    private let magicService: MagicService
    
    init(style: UITableView.Style, magicService: MagicService) {
        self.magicService = magicService
        super.init(style: style)
    }
    
    internal let setTableViewDelegate: SetTableViewDelegate = SetTableViewDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewDatasource = SetTableViewDatasource(items: [], tableView: self.tableView, delegate: self.setTableViewDelegate)
        self.setTableViewDatasource?.service = self
        self.setTableViewDelegate.setupDelegate(delegate: self.setTableViewDatasource)
        tableViewPropertySetup()
        getNextSet { [weak self] (set) in
            self?.setTableViewDatasource?.append(set)
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

extension SetTableViewController: PopulateUIProtocol {
    func getNextSet(handler: @escaping (MTGSet) -> Void) {
        self.magicService.getSet { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let set):
                    handler(set)
                case .error(let error):
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
    
    func getCardsFromPool(handler: @escaping ([Card]) -> Void) {
        self.magicService.getCards { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let cards):
                    handler(cards)
                case .error(let error):
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
    
}
