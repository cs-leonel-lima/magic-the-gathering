//
//  URLGetSessionOperation.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 29/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

class URLSessionGetOperation<T: Decodable> {
    
    let route: String
    
    init(route: String) {
        self.route = route
    }
    
    func execute(_ completion: @escaping (MagicAPIResult<T>) -> Void) {
        
        do {
            let url = try URLSessionGetOperation.createURL(fromRoute: route)
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let session = URLSession(configuration: .default)
            
            session.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    completion(.error(error))
                } else {
                    guard let data = data else {
                        completion(.error("Couldn't resolve data on the operation success!"))
                        return
                    }
                    
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(result))
                    } catch {
                        completion(.error(error))
                    }
                }
                }.resume()
            
        } catch {
            completion(.error(error))
        }
    }
    
    private static func createURL(fromRoute route: String) throws -> URL {
        guard let url = URL(string: route) else {
            throw "Bad formated url!"
        }
        return url
    }
}
