//
//  DetailTableViewController.swift
//  Milestone13-15Programmatically
//
//  Created by Karen Vardanian on 30.04.2023.
//
import MapKit
import UIKit



class DetailTableViewController: UITableViewController {
    
    let reuseIdentifier = "flagCell"
    
    var country: Country!
    
    var flagImage = UIImageView()
    
    var countyCapital = UILabel()
    var countyPopulation = UILabel()
    var countyTimezones = UILabel()
    var countyRegion = UILabel()
    var countyArea = UILabel()
    var countyStartOfWeek = UILabel()
    var countyCarSide = UILabel()
    var countyFlagString = UILabel()
    var countyBorder = UILabel()
    
    var currencyName = UILabel()
    var currencySymbol = UILabel()
    
    
    let sectionTitle = ["General", "Currencies"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.register(FlagCell.self, forCellReuseIdentifier: reuseIdentifier)
        
       
    }
    
    

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sectionTitle[indexPath.section] {
        case "Flag":
            // Return the desired height for the flag cell
            return 400
        default:
            // Return the default height for other cells
            return UITableView.automaticDimension
        }
    }

    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch sectionTitle[section] {
        case "Flag": return 1
        case "General": return 8
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
            case 1: cell.textLabel?.text = "Population: \(convertNumberToString(countyPopulation.text!) ) people"
            case 2: cell.textLabel?.text = "Region: \(countyRegion.text ?? "Unknown Region")"
            case 3: cell.textLabel?.text = "Timezones: \(countyTimezones.text ?? "Unknown Timezones")"
            case 4: cell.textLabel?.text = "Area: \(convertNumberToString(countyArea.text!) ) km²"
            case 5: cell.textLabel?.text = "Start of week: \(String(describing: countyStartOfWeek.text!)) "
            case 6: cell.textLabel?.text = "Car side: \(countyCarSide.text!)"
            case 7: cell.textLabel?.text = "Flag emoji: \(countyFlagString.text!)"
            default:
                return cell
            }
            return cell
       
        case "Currencies":
            switch indexPath.row {
            case 0: cell.textLabel?.text = "Currency: '\(currencySymbol.text!)100' \(currencyName.text!)"
            default:
                return cell
            }
            return cell
            
        default:
            break
        }
        

        return UITableViewCell()
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
