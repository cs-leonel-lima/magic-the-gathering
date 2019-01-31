//
//  BasePresentationComposer.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 30/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

class BasePresentationComposer: PresentationComposer {
    
    private let setService: MTGSetService
    private let cardService: CardService
    
    init(setService: MTGSetService = APIClientSetService(), cardService: CardService = APIClientCardService()) {
        self.setService = setService
        self.cardService = cardService
    }
    
    func getSetPresentation(_ completion: @escaping (NetworkOperationResult<SetPresentation>) -> Void) {
        
        setService.getSet { result in
            
            switch result {
            case .success(let set):
                
                self.cardService.getCards(of: set) { result in
                    
                    switch result {
                    case .success(let cards):
                        let setPresentation = SetPresentation(set: set, cards: cards)
                        completion(.success(setPresentation))
                    case .error(let error):
                        completion(.error(error))
                    }
                }
                
            case .error(let error):
                completion(.error(error))
            }
        }
        
    }
}
