//
//  DatabaseSetService.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 31/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

class DatabaseSetService: MTGSetService {
    
    private var setsStack: [MTGSet] = [] {
        didSet {
            setsStack = setsStack.sorted().reversed()
        }
    }
    
    private var needsSetsLoad: Bool {
        return setsStack.count == 0
    }
    
    private var nextSet: MTGSet {
        return setsStack.removeFirst()
    }
    
    func getSet(_ completion: @escaping (NetworkOperationResult<MTGSet>) -> Void) {
        
        if needsSetsLoad {
            do {
                let sets = try DataAccessObject<MTGSet>().getAll()
                setsStack.append(contentsOf: sets)
                completion(.success(nextSet))
            } catch {
                completion(.error(error))
            }
        } else {
            completion(.success(nextSet))
        }
    }
}
