//
//  ContentView.swift
//  SwiftUIHotProspects
//
//  Created by Karen Vardanian on 31.03.2023.
//

import SwiftUI
import UserNotifications


struct ContentView: View {
    @State private var colors = Color.red
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All success")
                    } else if let error = error {
                        print("error \(error.localizedDescription)")
                    }
                }
            }
            
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the dog"
                content.subtitle = "It looks hungry"
                content.sound = .default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
