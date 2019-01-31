import Foundation

protocol MTGSetService {
    func getSet(_ completion: @escaping (NetworkOperationResult<MTGSet>) -> Void)
}

protocol CardService {
    func getCards(of set: MTGSet, _ completion: @escaping (_ result: NetworkOperationResult<[Card]>) -> Void)
}
