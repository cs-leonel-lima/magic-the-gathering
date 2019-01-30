//
//  APIClientCardService.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 30/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

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
        
        operation.request(at: route, decodingType: [String: [Card]].self) { result in
            switch result {
            case .success(let dictionary):
                guard let cards = dictionary["cards"] else {
                    completion(.error("Magic API may have changed the Cards JSON response format!"))
                    return
                }
                
                resultsUntilNow += cards
                
                if cards.count % 100 != 0 {
                    completion(.success(resultsUntilNow))
                } else {
                    self.requestCardsRecursively(of: set, atPage: page + 1, previousResult: resultsUntilNow, completion)
                }
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
