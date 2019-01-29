import UIKit

class SetTableViewDelegate: NSObject, UITableViewDelegate {
    weak var delegate: SetViewForHeaderDelegate?

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleHeader = self.delegate?.titleForHeader(in: section)
        let headerView = SetHeaderSectionTableView(titleForHeader: titleHeader)
        return headerView
    }
    
    func setupDelegate(delegate: SetViewForHeaderDelegate?) {
        self.delegate = delegate
    }
}
