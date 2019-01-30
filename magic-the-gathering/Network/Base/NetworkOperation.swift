//
//  NetworkOperation.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 30/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

enum NetworkOperationResult<T> {
    case success(T)
    case error(Error)
}

protocol NetworkOperation {
    func request<T>(at route: String, decodingType: T.Type, _ completion: @escaping (NetworkOperationResult<T>) -> Void) where T: Decodable
}
