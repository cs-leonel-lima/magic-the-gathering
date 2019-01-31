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
        let mainView = SetTableViewController(style: .grouped, presentationComposer: BasePresentationComposer())
        self.window?.rootViewController = mainView
    }
}
