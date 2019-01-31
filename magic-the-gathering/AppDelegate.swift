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
        let presentationComposer = BasePresentationComposer(setService: APIClientSetService(), cardService: APIClientCardService())
        let mainView = SetTableViewController(style: .grouped, presentationComposer: presentationComposer)
        self.window?.rootViewController = mainView
    }
}
