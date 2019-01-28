import UIKit
import Nuke

extension UIImageView {
    func download(image url: String) {
        if let imageURL = URL(string: url) {
            Nuke.loadImage(
                with: imageURL,
                options: ImageLoadingOptions(
                    placeholder: R.image.padrequevedo(),
                    transition: .fadeIn(duration: 0.33)
                ),
                into: self
            )
        } else {
            fatalError("url parse error")
        }
    }
}
