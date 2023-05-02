//
//  CustomTableViewCell.swift
//  Milestone19-21Programmatically
//
//  Created by Karen Vardanian on 02.05.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let title = TitleLabel()
    let textField = TextEditorLabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: HomeTableViewController().reuseIdentifier)
        
        addView()
        settings()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
       func addView() {
           contentView.addSubview(title.titleLabel)
           contentView.addSubview(textField.textEditor)
       }
       
       func settings() {
           textField.textEditor.font = UIFont(name: "AppleSDGothicNeo-Light", size: 14)
           textField.textEditor.textColor = .lightGray
       }
       
       func layout() {
           NSLayoutConstraint.activate([
            title.titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            title.titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            title.titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            textField.textEditor.topAnchor.constraint(equalTo: title.titleLabel.bottomAnchor, constant: 5),
            textField.textEditor.leadingAnchor.constraint(equalTo: title.titleLabel.leadingAnchor),
            textField.textEditor.trailingAnchor.constraint(equalTo: title.titleLabel.trailingAnchor, constant: -16),
            textField.textEditor.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
           ])
       }

}
