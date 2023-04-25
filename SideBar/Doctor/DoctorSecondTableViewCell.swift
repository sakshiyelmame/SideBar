//
//  DoctorSecondTableViewCell.swift
//  SideBar
//
//  Created by Sakshi Yelmame on 17/04/23.
//

import UIKit

class DoctorSecondTableViewCell: UITableViewCell {
static let identifier = "DoctorSecondTableViewCell"
    @IBOutlet weak var drDiscriptionLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "DoctorSecondTableViewCell", bundle: nil)
    }
    
    public func configure(drDiscription : String) {
        self.drDiscriptionLabel.text = drDiscription
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
