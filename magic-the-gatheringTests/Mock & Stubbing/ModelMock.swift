//
//  SetsMock.swift
//  magic-the-gatheringTests
//
//  Created by gabriel.n.reynoso on 30/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

@testable import magic_the_gathering

extension MTGSet {
    static func response() -> [String: [MTGSet]] {
        return JSONHelper.dictionaryFrom(resource: "sets")
    }
    static func mock() -> [MTGSet] {
        return JSONHelper.objectFrom(resource: "sets")!
    }
}

extension Card {
    static func response() -> [String: [Card]] {
        return JSONHelper.dictionaryFrom(resource: "cards")
    }
    static func mock() -> [Card] {
        return JSONHelper.objectFrom(resource: "cards")!
    }
}
