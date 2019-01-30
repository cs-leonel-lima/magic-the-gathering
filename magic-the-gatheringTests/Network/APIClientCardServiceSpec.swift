import Quick
import Nimble

@testable import magic_the_gathering

class APIClientCardServiceSpec: QuickSpec {
    override func spec() {
        
        describe("API Client Card Service Operation") {
            
            context("when getting service") {
                
                let operation = NetworkOperationMock()
                let apiClientService = APIClientCardService(operation: operation)
                
                it("has not to get the set") {
                    operation.returnType = .cards
                    operation.succeed = false
                    
                    var succeded: Bool = false
                    
                    apiClientService.getCards(of: MTGSet.mock().first!, { (result) in
                        switch result {
                        case .success(_):
                            succeded = true
                        case .error(_):
                            succeded = false
                        }
                        expect(succeded).to(beFalse())
                    })
                }
                
                
                it("has to get the set from request") {
                    var succeded: Bool = false
                    operation.returnType = .cards
                    operation.succeed = true
                    
                    
                    apiClientService.getCards(of: MTGSet.mock().first!, { (result) in
                        switch result {
                        case .success(_):
                            succeded = true
                        case .error(_):
                            succeded = false
                        }
                        expect(succeded).to(beTrue())
                    })
                }
                
            }
        }
    }
}
