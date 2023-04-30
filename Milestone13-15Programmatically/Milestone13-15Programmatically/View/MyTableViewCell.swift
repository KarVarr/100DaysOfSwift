//
//  MyTableViewCell.swift
//  Milestone13-15Programmatically
//
//  Created by Karen Vardanian on 30.04.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    let homeTabelView = MyTableViewController()
    
    let myLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
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
        contentView.addSubview(myLabel)
        }
        
        func settings() {
            
        }
        
        func layout() {
            NSLayoutConstraint.activate([
                myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                myLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
        }


}
