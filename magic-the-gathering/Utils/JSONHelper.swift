import Foundation

class JSONHelper {
    static func getDataFrom(resource name: String) -> Data? {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            } catch {
                print(error)
            }
        }
        return nil
    }
}
