//
//  MTGSetsService.swift
//  magic-the-gathering
//
//  Created by isabel.isaura.l.lima on 28/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

protocol MTGSetsService {
    func getSets(completion: @escaping (MagicAPIResult<[MTGSet]>) -> Void)
}

class LocalMTGSetService: MTGSetsService {
    func getSets(completion: @escaping (MagicAPIResult<[MTGSet]>) -> Void) {
        let setsMock: [MTGSet] = JSONHelper.objectFrom(resource: "sets") ?? []
        let result = MagicAPIResult.success(setsMock)
        completion(result)
    }
}

class RemoteMTGSetsService: MTGSetsService {
    func getSets(completion: @escaping (MagicAPIResult<[MTGSet]>) -> Void) {
        let setsMock: [MTGSet] = JSONHelper.objectFrom(resource: "sets") ?? []
        let result = MagicAPIResult.success(setsMock)
        completion(result)
    }
}
