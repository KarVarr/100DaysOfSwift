//
//  ContentView.swift
//  SwiftUIMoonshot
//
//  Created by Karen Vardanian on 27.02.2023.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            Text(mission.description)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(5)
                            .background(.mint)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(20)
                        .shadow(color: .gray, radius: 10)
                    }
                }
            }
            .navigationTitle("Moonshot")
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
