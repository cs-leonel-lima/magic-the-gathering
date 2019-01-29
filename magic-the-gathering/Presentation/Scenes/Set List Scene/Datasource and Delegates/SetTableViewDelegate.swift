import UIKit

class SetTableViewDelegate: NSObject, UITableViewDelegate {
    weak var delegate: SetTableViewDelegate?

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SetHeaderSectionTableView()
    }
}
