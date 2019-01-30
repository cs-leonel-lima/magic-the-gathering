//
//  NetworkOperationMock.swift
//  magic-the-gatheringTests
//
//  Created by gabriel.n.reynoso on 30/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation
@testable import magic_the_gathering

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
    
    enum ReturnType {
        case sets
        case cards
    }
}
