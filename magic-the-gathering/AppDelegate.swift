import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
}

extension AppDelegate {
    private func setupWindow() {
        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        let mainView = TesteVC()//SetTableViewController(style: .grouped, magicService: LocalMagicService())
        self.window?.rootViewController = mainView
    }
}

class TesteVC: UIViewController {
    
    let screen = ScreenTest()
    
    override func loadView() {
        self.view = screen
    }
}

class ScreenTest: UIView {
    
    let tabBar = CustomTabBar()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .gray
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScreenTest: CodeView {
    func buildViewHierarchy() {
        addSubview(tabBar)
    }
    
    func setupConstraints() {
        tabBar.snp.makeConstraints { make in
            make.height.equalTo(41)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.width.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurations() {
        
    }
    
}
