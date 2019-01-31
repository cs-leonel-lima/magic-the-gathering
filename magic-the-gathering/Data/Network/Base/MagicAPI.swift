import Foundation

enum MagicAPI {
    
    static let domain: String = "https://api.magicthegathering.io/v1"
    
    static func cardsDomain(withParams params: String = "") -> String {
        return MagicAPI.mountAPIDomain(servicePath: "cards", andParams: params)
    }
    
    static func setsDomain(withParams params: String = "") -> String {
        return MagicAPI.mountAPIDomain(servicePath: "sets", andParams: params)
    }
    
    private static func mountAPIDomain(servicePath: String, andParams params: String = "") -> String {
        var finalDomain = "\(MagicAPI.domain)/\(servicePath)"
        
        if !params.isEmpty {
            finalDomain.append(contentsOf: "?\(params)")
        }
        
        return finalDomain
    }
}
