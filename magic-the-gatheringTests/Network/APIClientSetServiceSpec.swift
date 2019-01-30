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
                    
                    var succeded: Bool = false
                    
                    apiClientService.getSet { result in
                        switch result {
                        case .success(_):
                            succeded = true
                        case .error(_):
                            succeded = false
                        }
                    }
                    
                    expect(succeded).toEventually(beTrue())
                }
                
            }
        }
    }
}
