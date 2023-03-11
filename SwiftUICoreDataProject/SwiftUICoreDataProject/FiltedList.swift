//
//  FiltedList.swift
//  SwiftUICoreDataProject
//
//  Created by Karen Vardanian on 11.03.2023.
//
import CoreData
import SwiftUI

struct FiltedList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List (fetchRequest, id: \.self) {item in
            self.content(item)
        }
    }
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}


