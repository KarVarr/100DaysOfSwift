//
//  HomeTableViewController.swift
//  Milestone10-12Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//

import UIKit

class HomeTableViewController: UITableViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    let reuseIdentifier = "cell"
    let utility = Utility()
    
    var places = [Place]()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.5960784314, green: 0.8666666667, blue: 0.5911045668, alpha: 1)
        
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        title = "New places"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newPlace))
        
        let defaults = UserDefaults.standard
        
        if let savedPlace = defaults.object(forKey: "places") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                places = try jsonDecoder.decode([Place].self, from: savedPlace)
            } catch {
                print("Failed to load place")
            }
        }
    }
    
    //MARK: - Function
    
    @objc func newPlace() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appending(path: imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 1) {
            try? jpegData.write(to: imagePath)
        }
        
        let newPlace = Place(image: imageName, name: "Unknown", caption: "Name image")
        places.append(newPlace)
        save()
        tableView.reloadData()
        
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(places) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "places")
        } else {
            print("Failed to save place")
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MyTableViewCell
        cell.accessoryType = .disclosureIndicator
        
        let place = places[indexPath.row]
        cell.myLabel.text = place.name
        
        
        let imagePath = getDocumentsDirectory().appending(path: place.image)
        cell.myImageView.image = UIImage(contentsOfFile: imagePath.path())
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let place = places[indexPath.row]
        let imagePath = getDocumentsDirectory().appending(path: place.image)
        
        
        let newVC = ImageViewController()
        newVC.image.showingImage.image = UIImage(contentsOfFile: imagePath.path())
        
        
        navigationController?.pushViewController(newVC, animated: true)
    }
}
