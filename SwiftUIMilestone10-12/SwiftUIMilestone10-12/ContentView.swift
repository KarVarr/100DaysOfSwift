//
//  ContentView.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 12.03.2023.
//

import SwiftUI

struct ContentView: View {
    private var arr = ["a", "b", "c", "d", "e", "f", "g"]
    @State private var results = [UserModel]()
    
    
    private var adaptiveColumns = [ GridItem(.adaptive(minimum: 170))]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns ,spacing: 30) {
                    ForEach(results, id: \.id) { item in
                        NavigationLink(destination: DetailView()) {
                            VStack(alignment: .leading) {
                                Text("hello")
                                
                                Text("name \(item.name)")
                                    .font(.system(size: 30, weight: .medium, design: .rounded))
                                    .foregroundColor(.white)
                                
                                Text("email \(item.email)")
                                    .font(.system(size: 24, weight: .light, design: .serif))
                                    .foregroundColor(.gray)
                            }
                            .border(.black)
                            .frame(minWidth: 170, minHeight: 170, alignment: .topLeading)
                            .background(.mint)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                    }
                }
                .task {
                    await loadData()
                }
                
               
            }
         
            .navigationTitle("Friends 😛")
           
        }
    }
     
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
//            print(String(data: data, encoding: .utf8) ?? "")
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
                print(decodedResponse)
            } else {
                print("Error deconding JSON data")
            }
        
        } catch let error {
            print("Invalid data")
            print("Error decoding response: \(error.localizedDescription)")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
