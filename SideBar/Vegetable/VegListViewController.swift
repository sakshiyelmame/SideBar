//
//  VegListViewController.swift
//  SideBar
//
//  Created by Sakshi Yelmame on 16/04/23.
//

import UIKit

class VegListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {
    
    var vegetableList = [Vegetable]()
    var searchVeg = [Vegetable]()
    var searching = false
    
    @IBOutlet weak var MyUITableView: UITableView!
    
    @IBOutlet weak var vegUISearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
            return searchVeg.count
        }
        else
        {
            return vegetableList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching {
            cell.textLabel?.text = searchVeg[indexPath.row].name
            cell.imageView?.image = UIImage(named: searchVeg[indexPath.row].imagename)
            cell.textLabel?.font = UIFont(name: "Helventica-Bold", size: 20)
        }else {
            cell.textLabel?.text = vegetableList[indexPath.row].name
            cell.imageView?.image = UIImage(named: vegetableList[indexPath.row].imagename)
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
            searchVeg.removeAll()
            for vegetable in vegetableList {
                if vegetable.name.lowercased().contains(searchText.lowercased()){
                    searchVeg.append(vegetable)
                }
            }
        }
        else
        {
            searching = false
            searchVeg.removeAll()
            searchVeg = vegetableList
        }
        MyUITableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        MyUITableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: .main)
        let vc = main.instantiateViewController(withIdentifier: "VegeDetailsViewController") as! VegeDetailsViewController
        if searching == true {
            vc.selectedVegetableInfo = Vegetable(name: searchVeg[indexPath.row].name, imagename: searchVeg[indexPath.row].imagename, description: searchVeg[indexPath.row].description)
        }
        else{
            vc.selectedVegetableInfo = Vegetable(name: vegetableList[indexPath.row].name, imagename: vegetableList[indexPath.row].imagename, description: vegetableList[indexPath.row].description)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchData() {
        guard let fileLocation = Bundle.main.url(forResource: "Vegetable", withExtension: "json") else {
            return
        }
        do
        {
            let data = try Data(contentsOf: fileLocation)
            let receivedData = try JSONDecoder().decode([Vegetable].self, from: data)
            print(receivedData)
            self.vegetableList = receivedData
            DispatchQueue.main.async {
                self.MyUITableView.reloadData()
            }
        }
        catch
        {
            print("Error while decoding json")
        }
    }
}
