//
//  Expenses.swift
//  SwiftUIiExpense
//
//  Created by Karen Vardanian on 26.02.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
