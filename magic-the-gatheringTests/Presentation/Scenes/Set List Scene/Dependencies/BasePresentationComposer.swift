import Quick
import Nimble

@testable import magic_the_gathering

class MTGSetServiceMock: MTGSetService {
    var didCall: Bool = false
    var succed: Bool = true
    func getSet(_ completion: @escaping (NetworkOperationResult<MTGSet>) -> Void) {
        didCall = true
        if succed {
            completion(.success(MTGSet.mock().first!))
        } else {
            completion(.error("error"))
        }
    }
}

class CardServiceMock: CardService {
    var didCall: Bool = false
    var succed: Bool = true
    func getCards(of set: MTGSet, _ completion: @escaping (NetworkOperationResult<[Card]>) -> Void) {
        didCall = true
        if succed {
            completion(.success(Card.mock()))
        } else {
            completion(.error("error"))
        }
    }
}

class APIClientPresentationComposerSpec: QuickSpec {
    
    override func spec() {
        
        let setService = MTGSetServiceMock()
        let cardService = CardServiceMock()
        
        let composer = BasePresentationComposer(setService: setService, cardService: cardService)
        
        describe("API client presentation spec") {
            
            context("requesting set presentation") {
                
                it("has to call service methods") {
                    composer.getSetPresentation { _ in }
                    expect(setService.didCall).to(beTrue())
                    expect(cardService.didCall).to(beTrue())
                }
                
                it("has to fail because of set error") {
                    setService.succed = false
                    cardService.succed = true
                    
                    var succeded = true
                    
                    composer.getSetPresentation { result in
                        switch result {
                        case .success(_):
                            succeded = true
                        case .error(_):
                            succeded = false
                        }
                    }
                    
                    expect(succeded).to(beFalse())
                }
                
                it("has to fail because of card error") {
                    setService.succed = true
                    cardService.succed = false
                    
                    var succeded = true
                    
                    composer.getSetPresentation { result in
                        switch result {
                        case .success(_):
                            succeded = true
                        case .error(_):
                            succeded = false
                        }
                    }
                    
                    expect(succeded).to(beFalse())
                }
                
                it("has to fail succed") {
                    setService.succed = true
                    cardService.succed = true
                    
                    var succeded = false
                    
                    composer.getSetPresentation { result in
                        switch result {
                        case .success(_):
                            succeded = true
                        case .error(_):
                            succeded = false
                        }
                    }
                    
                    expect(succeded).to(beTrue())
                }
            }
        }
    }
}
