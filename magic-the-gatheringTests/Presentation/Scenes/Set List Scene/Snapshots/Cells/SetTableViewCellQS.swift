import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import magic_the_gathering

class SetTableViewCellQS: QuickSpec {
    override func spec() {
        describe("The 'UI'") {
            it("should have the expected look and feel") {
                let frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 500))
                let view = SetTableViewCell(frame: frame)
                expect(view) == snapshot("SetTableViewCell")
            }
        }
    }
}
