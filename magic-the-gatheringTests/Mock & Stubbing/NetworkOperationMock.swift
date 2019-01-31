import Foundation
@testable import magic_the_gathering

enum ReturnType {
    case sets
    case cards
}

class NetworkOperationMock: NetworkOperation {
    
    var returnType: ReturnType = .sets
    
    var succeed: Bool = false
    
    private(set) var alreadyRequestedCards = false
    
    func request<T>(at route: String, decodingType: T.Type, _ completion: @escaping (DataResult<T>) -> Void) where T : Decodable {
        
        if succeed {
            switch returnType {
            case .sets:
                completion(.success(MTGSet.response() as! T))
            case .cards:
                var response: APIClientCardService.Response
                
                if alreadyRequestedCards {
                    response = APIClientCardService.Response(cards: [])
                } else {
                    response = Card.response()
                    alreadyRequestedCards = true
                }
                
                completion(.success( response as! T))
            }
        } else {
            completion(.error("error"))
        }
    }
}
