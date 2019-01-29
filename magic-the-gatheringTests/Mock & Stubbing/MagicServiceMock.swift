
import UIKit
@testable import magic_the_gathering

class MagicServiceMock: MagicService {
    
    var isGetCardsCalled: Bool = false
    var isGetSetCalled: Bool = false
    
    func getCards(_ completion: @escaping (MagicAPIResult<[Card]>) -> Void) {
        isGetCardsCalled = true
    }

    func getSet(_ completion: @escaping (MagicAPIResult<MTGSet>) -> Void) {
        isGetSetCalled = true
    }
}

class RemoteMagicServiceMock: RemoteMagicService {

}
