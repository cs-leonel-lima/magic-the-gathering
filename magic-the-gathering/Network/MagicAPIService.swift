//
//  MagicAPIService.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 29/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

class MagicAPIService {
    
    private var setsCache: [MTGSet] = [] {
        didSet {
            setsCache = setsCache.sorted().reversed()
        }
    }
    
    private var needsSetRequest: Bool {
        return setsCache.count == 0
    }
    
    private var nextSet: MTGSet {
        return setsCache[0]
    }
    
    private let operation: NetworkOperation
    
    init(operation: NetworkOperation) {
        self.operation = operation
    }
}

extension MagicAPIService: MagicService {
    
    func getSet(_ completion: @escaping (MagicAPIResult<MTGSet>) -> Void) {
        if needsSetRequest {
            requestMTGSets() { result in
                switch result {
                case .success(let sets):
                    self.setsCache.append(contentsOf: sets)
                    completion(.success(self.nextSet))
                    
                case .error(let error):
                    completion(.error(error))
                }
            }
        } else {
            completion(.success(self.nextSet))
        }
    }
    
    func getCards(_ completion: @escaping (MagicAPIResult<[Card]>) -> Void) {
        
        if needsSetRequest {
            completion(.error("Attempting to request cards without requesting a set first."))
        } else {
            
            let requestingSet = setsCache.removeFirst()
            
            requestCards(of: requestingSet) { result in
                switch result {
                case .success(let cards):
                    completion(.success(cards))
                case .error(let error):
                    self.setsCache.insert(requestingSet, at: 0)
                    completion(.error(error))
                }
            }
        }
    }
}

extension MagicAPIService {
    
    private func requestMTGSets(_ completion: @escaping (MagicAPIResult<[MTGSet]>) -> Void) {
        
        let route = MagicAPI.setsDomain()
        
        operation.request(at: route, decodingType: [String: [MTGSet]].self) { result in
            switch result {
            case .success(let dictionary):
                guard let sets = dictionary["sets"] else {
                    completion(.error("Magic API may have changed the Cards JSON response format!"))
                    return
                }
                completion(.success(sets))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
    
    private func requestCards(of set: MTGSet, atPage page: Int = 1, previousResult: [Card] = [], _ completion: @escaping (MagicAPIResult<[Card]>) -> Void) {
        
        var resultsUntilNow = previousResult
        
        let route = MagicAPI.cardsDomain(withParams: "set=\(set.code)&page=\(page)&pageSize=100")
        
        operation.request(at: route, decodingType: [String:[Card]].self) { result in
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
                    self.requestCards(of: set, atPage: page + 1, previousResult: resultsUntilNow, completion)
                }
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
