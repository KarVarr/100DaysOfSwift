//
//  CustomTableViewCell.swift
//  Milestone19-21Programmatically
//
//  Created by Karen Vardanian on 02.05.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    
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
          
       }
       
       func settings() {
          
       }
       
       func layout() {
           NSLayoutConstraint.activate([
              
           ])
       }

}
