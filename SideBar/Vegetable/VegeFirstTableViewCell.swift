//
//  FirstTableViewCell.swift
//  SideBar
//
//  Created by Sakshi Yelmame on 16/04/23.
//

import UIKit

class VegeFirstTableViewCell: UITableViewCell {
    static let identifier = "VegeFirstTableViewCell"

    @IBOutlet weak var nameUILabel: UILabel!
    
    @IBOutlet weak var vegUIImageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "VegeFirstTableViewCell", bundle: nil)
    }
    
    public func configure(vegName : String, vegImageName : String){
        self.nameUILabel.text = vegName
        self.vegUIImageView.image = UIImage(named: vegImageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
