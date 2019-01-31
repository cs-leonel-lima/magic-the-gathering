import Foundation
@testable import magic_the_gathering

extension MTGSet {
    static func responseData() -> Data {
        return "{\"sets\":[]}".data(using: .utf8)!
    }
    static func response() -> APIClientSetService.Response {
        return APIClientSetService.Response(sets: mock())
    }
    static func mock() -> [MTGSet] {
        return JSONHelper.objectFrom(resource: "sets")!
    }
}

extension Card {
    static func responseData() -> Data {
        return "{\"cards\":[]}".data(using: .utf8)!
    }
    static func response() -> APIClientCardService.Response {
        return APIClientCardService.Response(cards: Card.mock())
    }
    static func mock() -> [Card] {
        return JSONHelper.objectFrom(resource: "cards")!
    }
}
