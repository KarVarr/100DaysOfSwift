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


struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var searchingText = ""
   
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    Text(resort.name)
                } label: {
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
                            .foregroundColor(.secondary)
                    }
                }
            }
            .searchable(text: $searchingText, prompt: "Search for a resort")
            .navigationTitle("Resorts")
            
            WelcomeView()
        }
//        .phoneOnlyStackNavigationView()
    }
    var filteredResorts: [Resort] {
        if searchingText.isEmpty {
            return resorts
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