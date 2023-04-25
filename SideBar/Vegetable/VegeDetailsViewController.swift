//
//  ResultViewController.swift
//  SideBar
//
//  Created by Sakshi Yelmame on 16/04/23.
//

import UIKit

class VegeDetailsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var selectedVegetableInfo : Vegetable?

    @IBOutlet weak var VegeUITableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VegeUITableView.register(VegeFirstTableViewCell.nib(), forCellReuseIdentifier: VegeFirstTableViewCell.identifier)
        VegeUITableView.register(VegeSecondTableViewCell.nib(), forCellReuseIdentifier: VegeSecondTableViewCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = VegeUITableView.dequeueReusableCell(withIdentifier: VegeFirstTableViewCell.identifier, for: indexPath) as! VegeFirstTableViewCell
            if let name = selectedVegetableInfo?.name, let imageName = selectedVegetableInfo?.imagename {
                cell.configure(vegName: name, vegImageName: imageName)
            }
            return cell
        }
        let cell = VegeUITableView.dequeueReusableCell(withIdentifier: VegeSecondTableViewCell.identifier, for: indexPath) as! VegeSecondTableViewCell
        if let name = selectedVegetableInfo?.description {
            cell.configure(vegDiscription: name)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        }
        return UITableView.automaticDimension
    }
}
