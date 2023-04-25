//
//  ViewController.swift
//  SideBar
//
//  Created by Sakshi Yelmame on 16/04/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrData = ["Vegetables","Doctors"]
    
    @IBOutlet weak var sideBarTableView: UITableView!
    @IBOutlet var sideView: UIView!
    
    var isSideViewOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideView.isHidden = true
     // sideBarTableView.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SideViewTableViewCell
        cell.vegUIImageView.image = UIImage(named: arrData[indexPath.row])
        cell.vegNameLabel.text = arrData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vegetableList : VegListViewController = self.storyboard?.instantiateViewController(identifier: "VegListViewController") as! VegListViewController
            self.navigationController?.pushViewController(vegetableList, animated: true)
        }else if indexPath.row == 1 {
            
            let doctorList : DoctorListViewController = self.storyboard?.instantiateViewController(identifier: "DoctorListViewController") as! DoctorListViewController
            self.navigationController?.pushViewController(doctorList, animated: true)
        }
        
    }
    
    @IBAction func menuButtonAction(_ sender: Any) {
        
        sideBarTableView.isHidden = false
        sideView.isHidden = false
        self.view.bringSubviewToFront(sideView)
        if !isSideViewOpen {
            isSideViewOpen = true
            sideView.frame = CGRect(x: 0, y: 88, width: 0, height: 499)
            sideBarTableView.frame = CGRect(x: 0, y: 0, width: 0, height: 499)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 88, width: 259, height: 499)
            sideBarTableView.frame = CGRect(x: 0, y: 0, width: 259, height: 499)
            UIView.commitAnimations()
        }
        else
        {
            sideBarTableView.isHidden = true
            sideView.isHidden = true
            isSideViewOpen = false
            sideView.frame = CGRect(x: 0, y: 88, width: 259, height: 499)
            sideBarTableView.frame = CGRect(x: 0, y: 0, width: 259, height: 499)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 88, width: 0, height: 499)
            sideBarTableView.frame = CGRect(x: 0, y: 0, width: 0, height: 499)
            UIView.commitAnimations()
        }
    }
}

