import Foundation

class JSONHelper {
    static func objectFrom<T: Decodable>(resource name: String) -> [T]? {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let object = try JSONDecoder().decode([String: [T]].self, from: data)
                return object[name]
            } catch {
                return nil
            }
        }
        return nil
    }
    
    static func initializeCardsArray(from data: Data) -> [Card]? {
        do {
            let cardsDictionary = try JSONDecoder().decode([String: [Card]].self, from: data)
            if let cards = cardsDictionary["cards"] {
                return cards
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
