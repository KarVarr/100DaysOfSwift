//
//  DataModel.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 12.03.2023.
//

import Foundation


class DataModel: ObservableObject {
    @Published var userData: [UserModel] = []
    func loadData() async {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            //print(String(data: data, encoding: .utf8) ?? "")
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let response = try decoder.decode([UserModel].self, from: data)
            DispatchQueue.main.async {
                self.userData = response
            }
        } catch {
            print("Error loading data: \(error.localizedDescription)")
        }
        
        
    }
}
