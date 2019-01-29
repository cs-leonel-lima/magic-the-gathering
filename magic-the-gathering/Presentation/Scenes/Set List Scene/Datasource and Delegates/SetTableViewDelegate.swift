import UIKit

class SetTableViewDelegate: NSObject, UITableViewDelegate {
    weak var delegate: SetViewForHeaderDelegate?

    init(delegate: SetViewForHeaderDelegate) {
        self.delegate = delegate
        super.init()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleHeader = self.delegate?.viewForHeader(section: section)
        let headerView = SetHeaderSectionTableView(titleForHeader: titleHeader)
        return headerView
    }
}
