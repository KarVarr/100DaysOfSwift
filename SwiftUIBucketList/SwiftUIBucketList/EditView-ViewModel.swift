//
//  EditView-ViewModel.swift
//  SwiftUIBucketList
//
//  Created by Karen Vardanian on 20.03.2023.
//

import Foundation


extension EditView {
    @MainActor class EditViewModel: ObservableObject {
       
        init(location: Location, name: String, description: String, pages: [Page]) {
                   self.location = location
                   self.name = name
                   self.description = description
                   self.pages = pages
               }
        
        var location: Location
        
        @Published var name: String
        @Published var description: String
       
        
        enum LoadingState {
            case loading, loaded, failed
        }
        
        @Published var loadingState = LoadingState.loading
        @Published var pages : [Page]
        
        
    }
}
