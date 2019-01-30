import UIKit
import SnapKit

protocol InteractionDelegate: class {
    func dismissViewController()
    func checkFavourite(at index: Int)
    func toggleFavourite(at index: Int)
}

class CategoryViewController: UIViewController {
    private var categoryView = CategoryView()
    private var categoryCards: [Card]
    
    init(cards: [Card]) {
        self.categoryCards = cards
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
        
    }
    
    func toggleFavourite(at index: Int) {
        
    }
    
    func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
