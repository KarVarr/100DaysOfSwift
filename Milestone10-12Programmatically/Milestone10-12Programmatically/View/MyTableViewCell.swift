//
//  MyTableViewCell.swift
//  Milestone10-12Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
     let homeTableView = HomeTableViewController()
    
     let myImageView = UIImageView()
     let myLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: homeTableView.reuseIdentifier)
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
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
    }
    
    func settings() {
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.text = "Unknown"
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.contentMode = .scaleToFill
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = 5
        
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            myImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            myImageView.widthAnchor.constraint(equalToConstant: 120),
            myImageView.heightAnchor.constraint(equalToConstant: 100),
            
            myLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 20),
        ])
    }

}
