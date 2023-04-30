//
//  FlagCell.swift
//  Milestone13-15Programmatically
//
//  Created by Karen Vardanian on 30.04.2023.
//

import UIKit

class FlagCell: UITableViewCell {
    
    private let flagCell = DetailTableViewController()
    
    let flagImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: flagCell.reuseIdentifier)
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
        contentView.addSubview(flagImageView)
    }
    
    func settings() {
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.contentMode = .scaleToFill
        flagImageView.clipsToBounds = true
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            flagImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            flagImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            flagImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 300),
            flagImageView.heightAnchor.constraint(equalToConstant: 400),
        ])
    }

}
