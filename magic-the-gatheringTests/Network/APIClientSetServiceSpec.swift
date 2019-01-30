import Quick
import Nimble

@testable import magic_the_gathering

class APIClientSetServiceSpec: QuickSpec {
    override func spec() {
        
        describe("API Client Set Service Operation") {
            
            context("when getting service") {
                
                let operation = NetworkOperationMock()
                let apiClientService = APIClientSetService(operation: operation)
                
                it("has to get the set") {
                    operation.returnType = .sets
                    operation.succeed = true
                    apiClientService.getSet({ (operation) in
                        var didFail: Bool = true
                        
                        switch operation {
                        case .error(let error):
                            didFail = true
                        case .success(let set):
                           didFail = false
                        }
                        
                    })
                }
                
            }
        }
    }
}
