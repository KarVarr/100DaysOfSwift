//
//  MyTableViewController.swift
//  Milestone13-15Programmatically
//
//  Created by Karen Vardanian on 30.04.2023.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    let reuseIdentifier = "reuseIdentifier"

    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings()
        getRequest()
    }
    
    func settings() {
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func getRequest() {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else {
            print("Invalid URL")
            return
        }
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                return print(error?.localizedDescription as Any)
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    // handle invalid response error
                    return
                }
            
            if let data = data {
                do {
                    self.countries = try JSONDecoder().decode([Country].self, from: data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch  {
                    print("Error decoding country data: \(error.localizedDescription)")
                }
            } else {
                print("No data received")
            }
          
           
        }
        task.resume()
    }
    
    
    
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
 
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MyTableViewCell
        cell.accessoryType = .disclosureIndicator
        let country = countries[indexPath.row]
        
        cell.myLabel.nameLabel.numberOfLines = 0
        cell.myLabel.nameLabel.text = country.name?.official
  
        imagePath(country.flags?.png, cell.flagImageView)

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let country = countries[indexPath.row]
        let newVC = DetailTableViewController()
        newVC.title = country.name?.common
        
//        imagePath(country.flags?.png, newVC.flagImage)
//        newVC.flagImage.image = UIImage(named: "WaitingScore")

      
        newVC.countyCapital.text = country.capital?[0] 
        newVC.countyPopulation.text = "\(String(describing: country.population ?? 0))"
        newVC.countyRegion.text = country.region
        newVC.countyTimezones.text = country.timezones?[0]
        newVC.countyArea.text = "\(String(describing: country.area ?? 0))"
        newVC.countyCarSide.text = country.car?.side
        newVC.countyStartOfWeek.text = country.startOfWeek
        newVC.countyFlagString.text = country.flag
        
        
        
        if let currency = country.currencies?.values.first {
            newVC.currencyName.text = currency.name
            newVC.currencySymbol.text = currency.symbol
        }
        

        
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    func imagePath(_ url: String?,_ path: UIImageView) {
        if let flagUrl = url {
                if let url = URL(string: flagUrl) {
                    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            DispatchQueue.main.async {
                                path.image = image
                            }
                        }
                    })
                    task.resume()
                }
            }
    }
}
