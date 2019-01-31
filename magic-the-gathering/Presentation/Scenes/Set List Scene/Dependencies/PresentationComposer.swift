//
//  PresentationComposer.swift
//  magic-the-gathering
//
//  Created by gabriel.n.reynoso on 30/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

struct SetPresentation {
    let set: MTGSet
    let cards: [Card]
}

typealias ComposerResult = DataResult

protocol PresentationComposer {
    func getSetPresentation(_ completion: @escaping (_ result: ComposerResult<SetPresentation>) -> Void)
}
