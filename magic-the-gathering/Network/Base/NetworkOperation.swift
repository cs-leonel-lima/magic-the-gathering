import Foundation

enum NetworkOperationResult<T> {
    case success(T)
    case error(Error)
}

protocol NetworkOperation {
    func request<T>(at route: String, decodingType: T.Type, _ completion: @escaping (NetworkOperationResult<T>) -> Void) where T: Decodable
}
