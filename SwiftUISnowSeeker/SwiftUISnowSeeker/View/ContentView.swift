//
//  ContentView.swift
//  SwiftUISnowSeeker
//
//  Created by Karen Vardanian on 10.04.2023.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

//Challenge 3
enum SortType {
    case defaultSort
    case name
    case country
}


struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var searchingText = ""
    @State private var isShowingSheet = false
    @State private var sort = SortType.defaultSort
    @StateObject var favorites = Favorites()
    
    let gradient = LinearGradient(colors: [.green, .cyan, .indigo, .purple], startPoint: .leading, endPoint: .trailing)
    
    let navGradient = AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .topTrailing)

   
    
    var body: some View {
        NavigationView {
            
            List(sorted) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.black.opacity(0.55))
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                    }
                }

                .listRowBackground(gradient)
                .shadow(radius: 5)
            }
            .listStyle(.plain)
            .background(navGradient)
            .foregroundColor(.white)
            .searchable(text: $searchingText, prompt: "Search for a resort")
            
            
            .navigationTitle("Resorts")
            .toolbar {
                Button {
                    isShowingSheet = true
                    
                } label: {
                    Label("Filter", systemImage: "list.number")
                }
            }
            .foregroundColor(.white)
            
            WelcomeView()
            
                
        }
        
        .environmentObject(favorites)
        //Challenge 3
        .confirmationDialog("Filter", isPresented: $isShowingSheet) {
            Button("Default", action: {sort = .defaultSort})
            Button("Country", action: {sort = .country})
            Button("Name", action: {sort = .name})
        }
//        .phoneOnlyStackNavigationView()
        
    }
    //Challenge 3
    var sorted: [Resort] {
        switch sort {
        case .defaultSort: return resorts
        case .name: return resorts.sorted{ $0.name < $1.name}
        case .country: return resorts.sorted{ $0.country < $1.country}
        }
    }
    
    var filteredResorts: [Resort] {
        if searchingText.isEmpty {
            return sorted
        } else {
            return resorts.filter{$0.name.localizedCaseInsensitiveContains(searchingText)}
        }
    }
  
    
   
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
