//
//  CardService.swift
//  magic-the-gathering
//
//  Created by isabel.isaura.l.lima on 28/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

typealias MagicService = MTGSetService & CardService

protocol MTGSetService {
    func getSet(_ completion: @escaping (MagicAPIResult<MTGSet>) -> Void)
}

protocol CardService: class {
    func getCards(_ completion: @escaping (_ result: MagicAPIResult<[Card]>) -> Void)
}

class LocalMagicService: CardService, MTGSetService {
    func getSet(_ completion: @escaping (MagicAPIResult<MTGSet>) -> Void) {
        let setsMock: MTGSet = JSONHelper.objectFrom(resource: "sets")!.first!
        let result = MagicAPIResult.success(setsMock)
        completion(result)
    }
    
    func getCards(_ completion: @escaping (_ result: MagicAPIResult<[Card]>) -> Void) {
        let cards: [Card] = JSONHelper.objectFrom(resource: "cards") ?? []
        let successCase = MagicAPIResult.success(cards)
        completion(successCase)
    }
}

class RemoteMagicService: CardService, MTGSetService {
    func getSet(_ completion: @escaping (MagicAPIResult<MTGSet>) -> Void) {
        let setsMock: MTGSet = JSONHelper.objectFrom(resource: "sets")!.first!
        let result = MagicAPIResult.success(setsMock)
        completion(result)
    }
    
    func getCards(_ completion: @escaping (MagicAPIResult<[Card]>) -> Void) {
        let cards: [Card] = JSONHelper.objectFrom(resource: "cards") ?? []
        let successCase = MagicAPIResult.success(cards)
        completion(successCase)
    }
}

// Temporary
enum MagicAPIResult<Value> {
    case success(Value)
    case error(Error)
}
