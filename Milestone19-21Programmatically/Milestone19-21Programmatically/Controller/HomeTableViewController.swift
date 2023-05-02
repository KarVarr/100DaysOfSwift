//
//  HomeTableViewController.swift
//  Milestone19-21Programmatically
//
//  Created by Karen Vardanian on 02.05.2023.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var note = [Notes]()
    
    let reuseIdentifier = "customCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Note"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNote))
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier:reuseIdentifier)
        
        let defaults = UserDefaults.standard
        
        if let savedNote = defaults.object(forKey: "note") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                note = try jsonDecoder.decode([Notes].self, from: savedNote)
            } catch {
                print("Failed to load note")
            }
        }
        
    }
    
    
    @objc func addNote() {
        let newNote = Notes(title: "New note", note: "Write something...")
        note.append(newNote)
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        note.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CustomTableViewCell
        cell.accessoryType = .disclosureIndicator
        let noteCell = note[indexPath.row]
        
        cell.title.titleLabel.text = noteCell.title
        cell.textField.textEditor.text = noteCell.note
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = DetailViewController()
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
}
