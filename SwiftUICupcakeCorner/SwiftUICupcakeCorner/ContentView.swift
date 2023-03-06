//
//  ContentView.swift
//  SwiftUICupcakeCorner
//
//  Created by Karen Vardanian on 06.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        NavigationView {
            List(results, id: \.trackId) { item in
                NavigationLink(destination: DetailView(result: Result(trackId: item.trackId, trackName: item.trackName, collectionName: item.collectionName, artworkUrl30: item.artworkUrl30, artworkUrl100: item.artworkUrl100, country: item.country, trackTimeMillis: item.trackTimeMillis))) {
                    VStack (alignment: .leading) {
                        HStack {
                            AsyncImage(url: URL(string: item.artworkUrl30)!)
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            Text(item.trackName)
                                .font(.headline)
                        }
                        Text(item.collectionName)
                        Text( String( format: "%.2f", Double(item.trackTimeMillis) / 60000.0) + " minuts")
                    }
                }
            }.task {
                await loadData()
            }
            .navigationTitle("Taylor Swift")
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
