//
//  TableViewCell.swift
//  Milestone4-6Programmatically
//
//  Created by Karen Vardanian on 16.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "reuseIdentifier"
    
    var numberOfRow: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.font = .systemFont(ofSize: 24, weight: .light)
        label.text = "N/A"
        return label
    }()
    var textOfRow: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brown
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "No item"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        cellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(numberOf itemRow: Int, row item: String) {
        self.textOfRow.text = item
        self.numberOfRow.text = String(itemRow)
    }
    
    
    private func addView () {
        contentView.addSubview(textOfRow)
        contentView.addSubview(numberOfRow)
    }
    
    private func cellLayout() {
        NSLayoutConstraint.activate([
            numberOfRow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            numberOfRow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            textOfRow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            textOfRow.leadingAnchor.constraint(equalTo: numberOfRow.trailingAnchor, constant: 20)
        ])
    }
    
}
