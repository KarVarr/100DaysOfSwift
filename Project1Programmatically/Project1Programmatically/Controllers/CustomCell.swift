//
//  CustomCell.swift
//  Project1Programmatically
//
//  Created by Karen Vardanian on 02.03.2023.
//

import UIKit

class CustomCell: UITableViewCell {

  static let identifier = "CustomCell"
    
   private let myImageView: UIImageView = {
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       image.layer.cornerRadius = 20
       image.contentMode = .scaleAspectFill
       image.clipsToBounds = true
       image.image = UIImage(systemName: "questionmark")
        return image
    }()
    
    private let myLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = "Error"
        return label
    }()
    
    private let myNumberOfPictures: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "Error"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addViews()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with image: UIImage, and label: String, numberOf pictures: Int) {
        self.myImageView.image = image
        self.myLabel.text = label
        self.myNumberOfPictures.text = "\(pictures)"
    }
    
    
    private func addViews() {
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        contentView.addSubview(myNumberOfPictures)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            myNumberOfPictures.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            myNumberOfPictures.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myNumberOfPictures.widthAnchor.constraint(equalToConstant: 25),
            
            myImageView.leadingAnchor.constraint(equalTo: myNumberOfPictures.trailingAnchor, constant: 5),
            myImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myImageView.widthAnchor.constraint(equalToConstant: 40),
            myImageView.heightAnchor.constraint(equalToConstant: 40),
            
            myLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 16),
            myLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            myLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            

        ])
    }
    
}
