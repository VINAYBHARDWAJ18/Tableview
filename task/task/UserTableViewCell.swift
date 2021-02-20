//
//  UserTableViewCell.swift
//  task
//
//  Created by vinay bhardwaj on 17/02/21.
//

import UIKit
protocol UserDeletionProtocol:class {
    func cellDeletedAtIndexPath(indexPath:IndexPath)
}
class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    var cellIndex:IndexPath?
    weak var delegate:UserDeletionProtocol?
    @IBAction func deleteBtnTapped(_ sender: UIButton) {
        guard let cellIndex = cellIndex else { return }
        delegate?.cellDeletedAtIndexPath(indexPath: cellIndex)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
