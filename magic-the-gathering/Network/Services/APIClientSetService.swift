//
//  APIClientSetService.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 30/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

class APIClientSetService: MTGSetService {
    
    private static var setsStack: [MTGSet] = []
    
    private static var needsSetRequest: Bool {
        return setsStack.count == 0
    }
    
    private static var popSet: MTGSet {
        return setsStack.removeFirst()
    }
    
    let operation: NetworkOperation
    
    init(operation: NetworkOperation = URLSessionGetOperation()) {
        self.operation = operation
    }
    
    func getSet(_ completion: @escaping (NetworkOperationResult<MTGSet>) -> Void) {
        
        if APIClientSetService.needsSetRequest {
            
            let route = MagicAPI.setsDomain()
            
            operation.request(at: route, decodingType: Response.self) { result in
                switch result {
                    
                case .success(let response):
                    APIClientSetService.setsStack.append(contentsOf: response.sets)
                    completion(.success(APIClientSetService.popSet))
                    
                case .error(let error):
                    completion(.error(error))
                }
            }
        } else {
            completion(.success(APIClientSetService.popSet))
        }
    }
    
    struct Response: Decodable {
        let sets: [MTGSet]
    }
}
