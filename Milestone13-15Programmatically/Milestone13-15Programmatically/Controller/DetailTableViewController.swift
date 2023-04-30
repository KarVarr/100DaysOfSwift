//
//  DetailTableViewController.swift
//  Milestone13-15Programmatically
//
//  Created by Karen Vardanian on 30.04.2023.
//

import UIKit



class DetailTableViewController: UITableViewController {
    var country: Country!
    
    
    
    var flagImage = UIImageView()
    
    var countyCapital = UILabel()
    var countyPopulation = UILabel()
    var countyTimezones = UILabel()
    var countyRegion = UILabel()
    var countyArea = UILabel()
    
    let sectionTitle = ["Flag", "General", "Languages", "Currencies"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch sectionTitle[section] {
        case "Flag": return 1
        case "General": return 5
        case "Languages": return 1
        case "Currencies": return 1
        default: return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        
        
        
        switch sectionTitle[indexPath.section] {
        case "General":
            switch indexPath.row {
            case 0: cell.textLabel?.text = "Capital: \(countyCapital.text ?? "Unknown Capital")"
            case 1: cell.textLabel?.text = "Population: \(convertNumberToString(countyPopulation.text!) ?? "Unknown Population") people"
            case 2: cell.textLabel?.text = "Region: \(countyRegion.text ?? "Unknown Region")"
            case 3: cell.textLabel?.text = "Timezones: \(countyTimezones.text ?? "Unknown Timezones")"
            case 4: cell.textLabel?.text = "Area: \(convertNumberToString(countyArea.text!) ?? "Unknown Area") km²"
            default:
                return cell
            }
            return cell
            
        case "Languages":
            
            return cell
            
            
        default:
            cell
        }
        

        return cell
    }
    
    func convertNumberToString(_ number: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        var convertedString: String?
        
        if let numberValue = Double(number), let formattedString = formatter.string(for: NSNumber(value: numberValue)) {
            convertedString = formattedString
        }
        
        return convertedString ?? "No Data"
    }


    

}
