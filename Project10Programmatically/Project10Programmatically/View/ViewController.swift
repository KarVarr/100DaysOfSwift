//
//  ViewController.swift
//  Project10Programmatically
//
//  Created by Karen Vardanian on 18.04.2023.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let saveKey = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 180)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .orange
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
//        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.label.text = "hello"
        return cell
    }
    
    
}

