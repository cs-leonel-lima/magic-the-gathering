//
//  MagicService.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 29/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

typealias MagicService = MTGSetService & CardService

protocol MTGSetService {
    func getSet(_ completion: @escaping (MagicAPIResult<MTGSet>) -> Void)
}

protocol CardService {
    func getCards(_ completion: @escaping (MagicAPIResult<[Card]>) -> Void)
}
