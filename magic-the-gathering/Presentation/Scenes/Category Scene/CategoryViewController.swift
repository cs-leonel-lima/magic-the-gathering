import UIKit

class CategoryViewController: UIViewController {
    private var categoryView = CategoryView()
    var categoryCards: [Card] = []
    
    override func loadView() {
        super.loadView()
        view = categoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryView.setupCategoryCollection(with: categoryCards)
    }
}
