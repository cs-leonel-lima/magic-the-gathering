import Foundation

class APIClientCardService: CardService {
    
    private let operation: NetworkOperation
    
    init(operation: NetworkOperation = URLSessionGetOperation()) {
        self.operation = operation
    }
    
    func getCards(of set: MTGSet, _ completion: @escaping (NetworkOperationResult<[Card]>) -> Void) {
        requestCardsRecursively(of: set, completion)
    }
    
    private func requestCardsRecursively(of set: MTGSet, atPage page: Int = 1, previousResult: [Card] = [], _ completion: @escaping (NetworkOperationResult<[Card]>) -> Void) {
        
        var resultsUntilNow = previousResult
        
        let route = MagicAPI.cardsDomain(withParams: "set=\(set.code)&page=\(page)&pageSize=100")
        
        operation.request(at: route, decodingType: Response.self) { result in
            switch result {
            case .success(let response):
                
                resultsUntilNow += response.cards
                
                if response.shouldLoadMore {
                    self.requestCardsRecursively(of: set, atPage: page + 1, previousResult: resultsUntilNow, completion)
                } else {
                    completion(.success(resultsUntilNow))
                }
            case .error(let error):
                completion(.error(error))
            }
        }
    }
    
    struct Response: Decodable {
        let cards: [Card]
        var shouldLoadMore: Bool {
            return cards.count % 100 == 0
        }
    }
}
