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
    let userDefaultKey = "note"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Note"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNote))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButton))
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier:reuseIdentifier)
        
        let defaults = UserDefaults.standard
        
        if let savedNote = defaults.object(forKey: userDefaultKey) as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                note = try jsonDecoder.decode([Notes].self, from: savedNote)
            } catch {
                print("Failed to load note!")
            }
        }
        
    }
    
    
    @objc func addNote() {
        let newNote = Notes(title: "New note", note: "Write something...")
        note.append(newNote)
        save()
        tableView.reloadData()
    }
    
    
    func save() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(note) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: userDefaultKey)
        } else {
            print("Failed to save people!")
        }
    }
    
    @objc func editButton() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        
        if tableView.isEditing {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editButton))
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButton))
        }
        UserDefaults.standard.removeObject(forKey: userDefaultKey)
        UserDefaults.standard.synchronize()
        save()
        tableView.reloadData()
        
        
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
        detailVC.titleLabel.titleLabel.text = note[indexPath.row].title
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.note.remove(at: indexPath.row)
            save()
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        note.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        save()
        
    }
    
    
    
}
