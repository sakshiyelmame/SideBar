//
//  DoctorDetailsViewController.swift
//  SideBar
//
//  Created by Sakshi Yelmame on 17/04/23.
//

import UIKit

class DoctorDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectedDoctorInfo : Doctors?
    @IBOutlet weak var drUITableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drUITableView.register(DoctorFirstTableViewCell.nib(), forCellReuseIdentifier: DoctorFirstTableViewCell.identifier)
        drUITableView.register(DoctorSecondTableViewCell.nib(), forCellReuseIdentifier: DoctorSecondTableViewCell.identifier)

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
            let cell = drUITableView.dequeueReusableCell(withIdentifier: DoctorFirstTableViewCell.identifier, for: indexPath) as! DoctorFirstTableViewCell
            if let name = selectedDoctorInfo?.name, let imageName = selectedDoctorInfo?.imagename {
                cell.configure(drName: name, drImageName: imageName)
            }
            return cell
        }
        let cell = drUITableView.dequeueReusableCell(withIdentifier: DoctorSecondTableViewCell.identifier, for: indexPath) as! DoctorSecondTableViewCell
        if let name = selectedDoctorInfo?.description {
            cell.configure(drDiscription: name)
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
