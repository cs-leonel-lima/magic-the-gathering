import UIKit
import SnapKit

protocol InteractionDelegate: class {
    func dismissViewController()
    func checkFavourite(at index: Int)
    func toggleFavourite(at index: Int)
}

class CategoryViewController: UIViewController {
    private var categoryView = CategoryView()
    private let cardsManager: CardsManager
    private var categoryCards: [Card]
    
    init(cards: [Card]) {
        self.categoryCards = cards
        
        do {
            cardsManager = try CardsManager(cards: categoryCards)
        } catch {
            fatalError()
        }
        super.init(nibName: nil, bundle: nil)
        categoryView.interactionDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = categoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryView.setupCategoryCollection(with: categoryCards)
    }
}

extension CategoryViewController: InteractionDelegate {
    func checkFavourite(at index: Int) {
        do {
            let card = categoryCards[index]
            if try cardsManager.isFavorite(card: card) {
                categoryView.presentFavoriteCardState()
            } else {
                categoryView.presentNonFavoriteCardState()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func toggleFavourite(at index: Int) {
        do {
            let card = categoryCards[index]
            if try cardsManager.isFavorite(card: card) {
                try cardsManager.unfavorite(card: card)
                categoryView.presentNonFavoriteCardState()
            } else {
                try cardsManager.favorite(card: card)
                categoryView.presentFavoriteCardState()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
}
