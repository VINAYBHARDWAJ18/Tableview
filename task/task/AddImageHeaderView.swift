//
//  AddImageHeaderView.swift
//  task
//
//  Created by vinay bhardwaj on 20/02/21.
//

import UIKit
protocol AddImageProtocol:class {
    func addImageBtnTapped()
}
class AddImageHeaderView: UITableViewHeaderFooterView {
    weak var delegate:AddImageProtocol?
    @IBOutlet weak var imgView: UIImageView!
    @IBAction func addImageBtnTapped(_ sender: UIButton) {
        delegate?.addImageBtnTapped()
    }
    
}
