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
        let mainView = SetListsContainerPageViewController(nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: mainView)
        setupNavbar(navigationBar: navigationController.navigationBar)
        self.window?.rootViewController = navigationController
    }
    
    private func setupNavbar(navigationBar: UINavigationBar) {
        navigationBar.setValue(true, forKey: "hidesShadow")
        navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
}
