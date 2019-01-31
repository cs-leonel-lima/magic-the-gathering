import Foundation

enum DataResult<T> {
    case success(T)
    case error(Error)
}

protocol MTGSetService {
    func getSet(_ completion: @escaping (DataResult<MTGSet>) -> Void)
}

protocol CardService {
    func getCards(of set: MTGSet, _ completion: @escaping (_ result: DataResult<[Card]>) -> Void)
}
