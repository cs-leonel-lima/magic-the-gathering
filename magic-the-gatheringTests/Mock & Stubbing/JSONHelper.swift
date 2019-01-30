import Foundation

class JSONHelper {
    
    static func dictionaryFrom<T: Decodable>(resource name: String) -> [String: [T]] {
        let path = Bundle.main.path(forResource: name, ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        return try! JSONDecoder().decode([String: [T]].self, from: data)
    }
    
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
}
