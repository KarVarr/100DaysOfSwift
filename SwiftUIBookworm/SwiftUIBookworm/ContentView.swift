//
//  ContentView.swift
//  SwiftUIBookworm
//
//  Created by Karen Vardanian on 07.03.2023.
//

import SwiftUI




struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            Button("Add") {
                let firstName = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastName = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstName.randomElement() ?? "UnknownFirstName"
                let chosenLastName = lastName.randomElement() ?? "UnknownLastName"
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
