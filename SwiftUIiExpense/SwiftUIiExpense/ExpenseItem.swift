//
//  ExpenseItem.swift
//  SwiftUIiExpense
//
//  Created by Karen Vardanian on 26.02.2023.
//

import Foundation


struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

