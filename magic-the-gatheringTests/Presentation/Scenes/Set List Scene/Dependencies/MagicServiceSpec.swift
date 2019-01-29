import Quick
import Nimble
@testable import magic_the_gathering

class MagicServiceSpec: QuickSpec {
    
    override func spec() {
        
        describe("Magic service") {
            
            let serviceMock = MagicServiceMock()
            let remoteMock = RemoteMagicServiceMock()
            
            context("Cards and Set Service") {
                it("Has to execute getCards") {
                    serviceMock.getCards { result in }
                    expect(serviceMock.isGetCardsCalled).to(beTrue())
                }
                
                it("Has to execute getSet") {
                    serviceMock.getSet { result in }
                    expect(serviceMock.isGetSetCalled).to(beTrue())
                }

            }
            
            context("Remote Magic Service") {
                // It depends on network layer mocks
            }
        }
        
    }
}
