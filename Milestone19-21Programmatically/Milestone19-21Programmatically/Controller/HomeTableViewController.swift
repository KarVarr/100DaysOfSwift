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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButton))
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier:reuseIdentifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        note = Storage.load()
        tableView.reloadData()
    }
    
    
    @objc func addNote() {
        let newNote = Notes(title: "New note", note: "Write something...", id: UUID())
        note.append(newNote)
        Storage.save(note: note)
        tableView.reloadData()
    }
    
    
    // MARK: - EDIT
    @objc func editButton() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        
        
        if tableView.isEditing {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editButton))
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButton))
        }
        UserDefaults.standard.removeObject(forKey: Storage().userDefaultKey)
        UserDefaults.standard.synchronize()
        Storage.save(note: note)
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
    
    
    // MARK: - SWIPE DELETE
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, success) in
            self.note.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [delete])
        Storage.save(note: note)
        tableView.reloadData()
        return swipeActions
    }
    
    // MARK: - MOVE
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        note.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        Storage.save(note: note)
        
    }
    
    
    
}
