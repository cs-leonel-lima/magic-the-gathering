import Foundation

protocol NetworkOperation {
    func request<T>(at route: String, decodingType: T.Type, _ completion: @escaping (DataResult<T>) -> Void) where T: Decodable
}
