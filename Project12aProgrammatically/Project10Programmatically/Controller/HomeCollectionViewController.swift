//
//  HomeCollectionViewController.swift
//  Project10Programmatically
//
//  Created by Karen Vardanian on 21.04.2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        self.collectionView!.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        title = "Add Person"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
        
        
        let defaults = UserDefaults.standard
        if let savedPeople = defaults.object(forKey: "people") as? Data {
            if let decodedPeople = try? NSKeyedUnarchiver.unarchivedObject(ofClasses: [Person.self], from: savedPeople) as? [Person] {
                people = decodedPeople
            }
        }
        
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.5145705342, blue: 1, alpha: 1)
        
        let person = people[indexPath.item]
        cell.label.text = person.name.capitalized
        
        let imagePath = getDocumentsDirectory().appending(path: person.image)
        cell.imageView.image = UIImage(contentsOfFile: imagePath.path)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 180, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        //Challenge 1
        let acDelete = UIAlertController(title: "Delete or Rename?", message: nil, preferredStyle: .actionSheet)
        acDelete.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        acDelete.addAction(UIAlertAction(title: "Delete", style: .default) {[weak self] _ in
            self?.people.remove(at: indexPath.item)
            self?.save()
            collectionView.reloadData()
        })
        acDelete.addAction(UIAlertAction(title: "Rename", style: .default) {[weak self] _ in
            self?.renamePerson(person)
        })
        
        present(acDelete, animated: true)
        
    }
    
    //MARK: - Functions
    
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let person = Person(name: "Unknown", image: imageName)
        people.append(person)
        save()
        collectionView.reloadData()

        dismiss(animated: true)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths.first!
    }
    
    func renamePerson(_ person: Person) {
        let ac = UIAlertController(title: "Rename Person", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default) {[weak self, weak ac] _ in
            guard let newName = ac?.textFields?[0].text else { return }
            person.name = newName
            
            self?.collectionView.reloadData()
        })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
    func save() {
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: people, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "people")
        }
    }

}
