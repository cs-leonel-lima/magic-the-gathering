import Foundation

struct Card {
    let id: String
    let name: String
    let types: [String]
    var imageURL: String?
    let mtgCodeSet: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
        case mtgCodeSet = "set"
        case imageURL = "imageUrl"
    }
}

extension Card: Decodable {
    init(from decoder: Decoder) throws {
        let cardContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try cardContainer.decode(String.self, forKey: .id)
        name = try cardContainer.decode(String.self, forKey: .name)
        types = try cardContainer.decode([String].self, forKey: .types)
        imageURL = try cardContainer.decodeIfPresent(String.self, forKey: .imageURL)
        mtgCodeSet = try cardContainer.decode(String.self, forKey: .mtgCodeSet)
        
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.name == rhs.name
    }
}