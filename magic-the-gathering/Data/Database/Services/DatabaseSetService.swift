//
//  DatabaseSetService.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 31/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

class DatabaseSetService: MTGSetService {
    
    private static var setsStack: [MTGSet] = [] {
        didSet {
            setsStack = setsStack.sorted().reversed()
        }
    }
    
    private static var needsSetsLoad: Bool {
        return setsStack.count == 0
    }
    
    private static var nextSet: MTGSet {
        return setsStack.removeFirst()
    }
    
    func getSet(_ completion: @escaping (DataResult<MTGSet>) -> Void) {
        
        if DatabaseSetService.needsSetsLoad {
            do {
                let sets = try DataAccessObject<MTGSet>().getAll()
                DatabaseSetService.setsStack.append(contentsOf: sets)
                completion(.success(DatabaseSetService.nextSet))
            } catch {
                completion(.error(error))
            }
        } else {
            completion(.success(DatabaseSetService.nextSet))
        }
    }
}
