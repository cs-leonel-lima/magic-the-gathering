import Foundation

class URLSessionGetOperation: NetworkOperation {
    
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T>(at route: String, decodingType: T.Type, _ completion: @escaping (DataResult<T>) -> Void) where T: Decodable {
        
        do {
            let url = try URLSessionGetOperation.createURL(fromRoute: route)
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            session.dataTask(with: request) { data, _, error in
                
                if let error = error {
                    completion(.error(error))
                } else {
                    guard let data = data else {
                        completion(.error("Couldn't resolve data on the operation success!"))
                        return
                    }
                    
                    do {
                        let result = try JSONDecoder().decode(decodingType, from: data)
                        completion(.success(result))
                    } catch {
                        completion(.error(error))
                    }
                }
            }.resume()
            
        } catch {
            completion(.error(error))
        }
    }
    
    private static func createURL(fromRoute route: String) throws -> URL {
        guard let url = URL(string: route) else {
            throw "Bad formated url!"
        }
        return url
    }
}
