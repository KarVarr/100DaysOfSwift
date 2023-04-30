//
//  MyTableViewController.swift
//  Milestone13-15Programmatically
//
//  Created by Karen Vardanian on 30.04.2023.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    let reuseIdentifier = "reuseIdentifier"

    var countries: [Countries] = []
    
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
                    self.countries = try JSONDecoder().decode([Countries].self, from: data)
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


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MyTableViewCell
        cell.accessoryType = .detailButton
        let country = countries[indexPath.row]
        
        cell.myLabel.text = ("\(country.name.common): \(country.region)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let newVC = ViewController()
        
        
        navigationController?.pushViewController(newVC, animated: true)
    }
    

  

}
