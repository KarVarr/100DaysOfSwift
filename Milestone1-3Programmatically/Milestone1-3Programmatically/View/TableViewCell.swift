//
//  TableViewCell.swift
//  Milestone1-3Programmatically
//
//  Created by Karen Vardanian on 09.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier = "CustomCell"
    
    private var image: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.image = UIImage(systemName: "questionmark.app.fill")
        return img
    }()
    
    private var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 24, weight: .black)
        label.textAlignment = .left
        label.text = "Unknown Country"
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addView()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    func addView() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
    }
    
    func settings (with image: UIImage, and title: String) {
        self.image.image = image
        self.titleLabel.text = title
        
        
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 70),
            image.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            
        ])
    }
    
    
  

}
