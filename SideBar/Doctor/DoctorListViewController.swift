//
//  DoctorListViewController.swift
//  SideBar
//
//  Created by Sakshi Yelmame on 17/04/23.
//

import UIKit

class DoctorListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var drList = [Doctors]()
    var searchDr = [Doctors]()
    var searching = false
    
    @IBOutlet weak var drSearchBar: UISearchBar!
    
    @IBOutlet weak var drUITableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
fetchData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
            return searchDr.count
        }
        else
        {
            return drList.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching{
            cell.textLabel?.text = searchDr[indexPath.row].name
            cell.imageView?.image = UIImage(named: searchDr[indexPath.row].imagename)
            cell.textLabel?.font = UIFont(name: "Helventica-Bold", size: 20)
        }
        else
        {
            cell.textLabel?.text = drList[indexPath.row].name
            cell.imageView?.image = UIImage(named: drList[indexPath.row].imagename)
            cell.textLabel?.font = UIFont(name: "Helventica-Bold", size: 20)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            searching = true
            searchDr.removeAll()
            for doctors in drList {
                if doctors.name.lowercased().contains(searchText.lowercased()){
                    searchDr.append(doctors)
                }
            }
        }
        else
        {
            searching = false
            searchDr.removeAll()
            searchDr = drList
        }
        drUITableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        drUITableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: .main)
        let vc = main.instantiateViewController(withIdentifier: "DoctorDetailsViewController") as! DoctorDetailsViewController
        if searching == true {
            vc.selectedDoctorInfo = Doctors(name: searchDr[indexPath.row].name, imagename: searchDr[indexPath.row].imagename, description: searchDr[indexPath.row].description)
        }
        else{
            vc.selectedDoctorInfo = Doctors(name: drList[indexPath.row].name, imagename: drList[indexPath.row].imagename, description: drList[indexPath.row].description)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    func fetchData() {
        guard let fileLocation = Bundle.main.url(forResource: "Doctor", withExtension: "json")
                else
        {
          return
        }
        do
        {
            let data = try Data(contentsOf: fileLocation)
            let receivedData = try JSONDecoder().decode([Doctors].self, from: data)
            print(receivedData)
            self.drList = receivedData
            DispatchQueue.main.async {
                self.drUITableView.reloadData()
            }
        }
        catch
        {
            print("Error Decoding Json")
        }
    }
}
