//
//  FormTableViewCell.swift
//  task
//
//  Created by vinay bhardwaj on 17/02/21.
//

import UIKit
protocol UserInfoProtocol:class {
    func userInfoEditedFor(key:String,value:String)
}
class FormTableViewCell: UITableViewCell {
    weak var  delegate:UserInfoProtocol?
    var userKey = ""
    @IBAction func textChanged(_ sender: UITextField) {
        if let userValue = sender.text{
            delegate?.userInfoEditedFor(key: userKey, value: userValue)
        }
    }
    @IBOutlet weak var formTextFiled: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
