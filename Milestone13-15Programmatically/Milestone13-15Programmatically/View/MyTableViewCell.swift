//
//  MyTableViewCell.swift
//  Milestone13-15Programmatically
//
//  Created by Karen Vardanian on 30.04.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    let homeTabelView = MyTableViewController()
    let myLabel = LabelNameCountry()
    let flagImageView = UIImageView() // Add this line
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: homeTabelView.reuseIdentifier)
        self.addView()
        self.settings()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    
    func addView() {
        contentView.addSubview(myLabel.nameLabel)
        contentView.addSubview(flagImageView)
    }
    
    func settings() {
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.contentMode = .scaleToFill
        flagImageView.clipsToBounds = true
        flagImageView.layer.cornerRadius = 5
        flagImageView.layer.borderWidth = 2
        flagImageView.layer.borderColor = UIColor.orange.cgColor
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            flagImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            flagImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            flagImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 100),
            flagImageView.heightAnchor.constraint(equalToConstant: 60),
            
            myLabel.nameLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 10),
            myLabel.nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myLabel.nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
        ])
    }
    
    
}
