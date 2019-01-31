import UIKit

protocol PagingProtocol {
    func goToNextPage()
    func goToPreviousPage()
}

class SetListsContainerPageViewController: UIPageViewController, PagingProtocol {
    
    private let tabBar = CustomTabBar()
    
    private lazy var viewControllerList: [UIViewController] = {
        let apiComposer = BasePresentationComposer(setService: APIClientSetService(), cardService: APIClientCardService())
        let dbComposer = BasePresentationComposer(setService: DatabaseSetService(), cardService: DatabaseCardService())
        let vc1 = SetTableViewController(style: .grouped, presentationComposer: apiComposer)
        let vc2 = SetTableViewController(style: .grouped, presentationComposer: dbComposer)
        
        return [vc1, vc2]
    }()

    override func viewDidLoad() {

        if let firstViewController = self.viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
        
        setupView()
        tabBar.delegate = self
        tabBar.layer.zPosition = 9999
        
    }
    
    func goToNextPage() {
        guard let currentViewController = self.viewControllers?.first else { return }
        
        guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else { return }
        
        setViewControllers([nextViewController], direction: .forward, animated: false, completion: nil)
        
    }
    
    func goToPreviousPage() {
        guard let currentViewController = self.viewControllers?.first else { return }
        
        guard let previousViewController = dataSource?.pageViewController( self, viewControllerBefore: currentViewController ) else { return }
        
        setViewControllers([previousViewController], direction: .reverse, animated: false, completion: nil)
        
    }
    
}

extension SetListsContainerPageViewController: CodeView {
    func buildViewHierarchy() {
        self.view.addSubview(tabBar)
    }
    
    func setupConstraints() {
        tabBar.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

    }
    
    func setupAdditionalConfigurations() {}
    
}
