//
//  tblCell.swift
//  task
//
//  Created by vinay bhardwaj on 16/02/21.
//

import UIKit


protocol tblCellProtocol : class {
    func delete(index:IndexPath)
}

class tblCell: UITableViewCell {
    
    
    
    @IBOutlet weak var lbl: UILabel!
    
    weak var delegate : tblCellProtocol!
    var myindexpath : IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    @IBAction func deleteTaPPED(_ sender: Any) {
        delegate.delete(index: myindexpath)
    }
    
    

}
