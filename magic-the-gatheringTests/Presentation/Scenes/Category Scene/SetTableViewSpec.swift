import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import magic_the_gathering

class SetTableViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        describe("SetTableViewController") {
            let mainView = SetTableViewController(style: .grouped, context: .local)
            let navigationController = UINavigationController(rootViewController: mainView)
            
            var window: UIWindow!
            
            beforeEach {
                self.setupNavbar(navigationBar: navigationController.navigationBar)
                window = UIWindow()
                window.makeKeyAndVisible()
                window.rootViewController = navigationController
                
            }
            
            context("SearchBar") {
                it("has to show SearchBar soon as TableViewController finishes loading") {
                    expect(window) == snapshot("SetTableView+SearchBar")
                }
            }
        }
    }
    
    func setupNavbar(navigationBar: UINavigationBar) {
        navigationBar.backgroundColor = .clear
        navigationBar.barTintColor = .clear
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = UIImage()
        navigationBar.setValue(true, forKey: "hidesShadow")
        navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
}
