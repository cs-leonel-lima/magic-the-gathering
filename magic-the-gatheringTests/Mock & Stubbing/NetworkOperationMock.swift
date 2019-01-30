//
//  NetworkOperationMock.swift
//  magic-the-gatheringTests
//
//  Created by gabriel.n.reynoso on 30/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation
@testable import magic_the_gathering

enum ReturnType {
    case sets
    case cards
}

class NetworkOperationMock: NetworkOperation {
    
    var returnType: ReturnType = .sets
    var errorType: ErrorType = .none
    
    func request<T>(at route: String, decodingType: T.Type, _ completion: @escaping (NetworkOperationResult<T>) -> Void) where T : Decodable {
        
        var response: NetworkOperationResult<T>
        
        switch returnType {
        case .sets:
            
            switch errorType {
                
            case .none:
                response = .success(MTGSet.response() as! T)
            case .changedReponse:
                response = .success(["badKey":[MTGSet]()] as! T)
            case .network:
                response = .error("Network error!")
            }
            
        case .cards:
            
            switch errorType {
                
            case .none:
                response = .success(Card.response() as! T)
            case .changedReponse:
                response = .success(["badKey":[Card]()] as! T)
            case .network:
                response = .error("Network error!")
            }
            
        }
        
        completion(response)
    }
    
    enum ErrorType {
        case none
        case changedReponse
        case network
    }
}
