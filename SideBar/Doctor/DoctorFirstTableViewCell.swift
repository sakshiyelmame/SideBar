//
//  DoctorFirstTableViewCell.swift
//  SideBar
//
//  Created by Sakshi Yelmame on 17/04/23.
//

import UIKit

class DoctorFirstTableViewCell: UITableViewCell {
static let identifier = "DoctorFirstTableViewCell"
    
    @IBOutlet weak var drNameLabel: UILabel!
    
    @IBOutlet weak var drImageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "DoctorFirstTableViewCell", bundle: nil)
    }
    public func configure(drName : String, drImageName : String){
        self.drNameLabel.text = drName
        self.drImageView.image = UIImage(named: drImageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
