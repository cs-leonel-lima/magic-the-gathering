import Quick
import Nimble
import Nimble_Snapshots
@testable import magic_the_gathering

class CustomTabBarSnapshot: QuickSpec {
    override func spec() {
        var tabBar: CustomTabBar!
        
        beforeEach {
            tabBar = CustomTabBar(frame: CGRect(x: 0, y: 0, width: 375, height: 55))
        }
        context("UI") {
            it("has the expected look and feel") {
                expect(tabBar) == snapshot("TabBar")
            }
        }

    }
}
