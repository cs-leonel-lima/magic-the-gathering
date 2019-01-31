import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import magic_the_gathering

class SetHeaderSectionTableViewQS: QuickSpec {
    override func spec() {
        describe("The 'UI'") {
            it("should have the expected look and feel") {
                let frame = CGRect(origin: .zero, size: CGSize(width: 500, height: 300))
                let view = SetHeaderSectionTableView(frame: frame, titleForHeader: "Set name - It can be a huge naaaame")
                expect(view) == snapshot("SetHeaderSectionTableViewQS")
            }
        }
    }
}
