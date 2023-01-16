//
//  Country.swift
//  Projects13and15Milestone
//
//  Created by Karen Vardanian on 15.01.2023.
//

import Foundation


struct County: Codable {
    let country: String
    let imageCountry: String
    
    func loadJson(fileName: String) -> Data? {
        let decoder = JSONDecoder()
        do {
           if let bundlePath = Bundle.main.path(forResource: "CountyJSON", ofType: "json"),
              let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
               return jsonData
           }
            
        } catch {
            print(error)
        }
        return nil
    }
    
}
