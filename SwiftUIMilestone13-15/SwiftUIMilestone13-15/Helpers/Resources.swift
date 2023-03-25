//
//  Resources.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 24.03.2023.
//
import SwiftUI
import Foundation


enum Resources {
    enum String {
        enum ContentView {
            static let mainTitle = "MeetUP"
            static let unknown = "Unknown"
            static let newFriend = "New friends can be added by clicking on the + button"
        }
        
        enum AddUserImage {
            static let navTitle = "Add a photo"
            
            
            enum Alert {
                static let title = "New friend's name"
                static let textField = "Enter a name"
                static let message = "Please enter a name"
            }
        }
    }
    
    enum AppColor {
        static let main = Color(red: 0.98, green: 0.93, blue: 0.80)
        static let secondary = Color(red: 1.00, green: 0.98, blue: 0.88)
        static let light = Color(red: 0.91, green: 0.93, blue: 0.79)
        static let dark = Color(red: 0.80, green: 0.84, blue: 0.68)
        
       
    }
}
