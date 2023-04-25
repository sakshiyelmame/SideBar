//
//  VegetableTableViewCell.swift
//  SideBar
//
//  Created by Sakshi Yelmame on 16/04/23.
//

import UIKit

class SideViewTableViewCell: UITableViewCell {

    @IBOutlet weak var vegUIImageView: UIImageView!
    
    @IBOutlet weak var vegNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
