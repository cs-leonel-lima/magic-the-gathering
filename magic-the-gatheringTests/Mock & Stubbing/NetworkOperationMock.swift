import Foundation
@testable import magic_the_gathering

enum ReturnType {
    case sets
    case cards
}

class NetworkOperationMock: NetworkOperation {
    
    var returnType: ReturnType = .sets
    
    var succeed: Bool = false
    
    func request<T>(at route: String, decodingType: T.Type, _ completion: @escaping (NetworkOperationResult<T>) -> Void) where T : Decodable {
        
        if succeed {
            switch returnType {
            case .sets:
                completion(.success(MTGSet.response() as! T))
            case .cards:
                completion(.success(Card.response() as! T))
            }
        } else {
            completion(.error("error"))
        }
    }
    
    enum ErrorType {
        case none
        case changedReponse
        case network
    }
}
