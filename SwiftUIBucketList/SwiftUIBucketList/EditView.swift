//
//  EditView.swift
//  SwiftUIBucketList
//
//  Created by Karen Vardanian on 20.03.2023.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
//    var location: Location
    
    var onSave: (Location) ->Void
    
    @StateObject private var editViewModel: EditViewModel
//    @State private var name: String
//    @State private var description: String
//
//
//    enum LoadingState {
//        case loading, loaded, failed
//    }
//
//    @State private var loadingState = LoadingState.loading
//    @State private var pages = [Page]()
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $editViewModel.name)
                    TextField("Description", text: $editViewModel.description)
                }
                
                Section("Nearby...") {
                    switch editViewModel.loadingState {
                    case .loading:
                        HStack {
                            Text("Loading...  ")
                            ProgressView()
                        }
                    case .loaded:
                        ForEach(editViewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ")
                            + Text(page.description)
                                .italic()
                        }
                    case.failed: Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = editViewModel.location
                    newLocation.id = UUID()
                    newLocation.name = editViewModel.name
                    newLocation.description = editViewModel.description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await fetchNearbyPlaces()
            }
        }
    }
    //Challenge 3
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.onSave = onSave
        _editViewModel = StateObject(wrappedValue: EditViewModel(location: location, name: "name", description: "desc", pages: []))
        editViewModel.name = location.name
        editViewModel.description = location.description
    }
    
    
    func fetchNearbyPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(editViewModel.location.coordinate.latitude)%7C\(editViewModel.location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else {
            print("Bad url \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            editViewModel.pages = items.query.pages.values.sorted()
            editViewModel.loadingState = .loaded
        } catch {
            editViewModel.loadingState = .failed
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example) {_ in}
    }
}
