//
//  SecondTableViewCell.swift
//  SideBar
//
//  Created by Sakshi Yelmame on 16/04/23.
//

import UIKit

class VegeSecondTableViewCell: UITableViewCell {
static let identifier = "VegeSecondTableViewCell"
    @IBOutlet weak var discriptionUILabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "VegeSecondTableViewCell", bundle: nil)
    }
    
    public func configure(vegDiscription: String){
        self.discriptionUILabel.text = vegDiscription
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
