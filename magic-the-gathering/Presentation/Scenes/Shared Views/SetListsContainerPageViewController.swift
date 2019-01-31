import UIKit

protocol PagingProtocol {
    func goToNextPage()
    func goToPreviousPage()
}

class SetListsContainerPageViewController: UIPageViewController, UIPageViewControllerDataSource, PagingProtocol {
    
    let tabBar = CustomTabBar()
    
    lazy var viewControllerList: [UIViewController] = {
        let vc1 = SetTableViewController(style: .grouped, magicService: RemoteMagicService())
        let vc2 = SetTableViewController(style: .grouped, magicService: LocalMagicService())
        
        return [vc1, vc2]
    }()

    override func viewDidLoad() {
        self.dataSource = self

        if let firstViewController = self.viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
        
        setupView()
        tabBar.delegate = self
        tabBar.layer.zPosition = 9999
        
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard viewControllerList.count > previousIndex else { return nil }
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else { return nil }
        
        guard viewControllerList.count > nextIndex else { return nil }
        
        return viewControllerList[nextIndex]
        
    }
    
    func goToNextPage(){
        
        guard let currentViewController = self.viewControllers?.first else { return }
        
        guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else { return }
        
        setViewControllers([nextViewController], direction: .forward, animated: false, completion: nil)
        
    }
    
    
    func goToPreviousPage(){
        
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
            make.height.equalTo(41)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

    }
    
    func setupAdditionalConfigurations() {

    }
    
}
