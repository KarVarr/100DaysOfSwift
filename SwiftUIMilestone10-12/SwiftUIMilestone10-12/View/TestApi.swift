//
//  TestApi.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 12.03.2023.
//

import SwiftUI
struct Course: Hashable, Codable {
    let name: String
    let image: String
}


class ViewModel: ObservableObject {
    @Published var courses: [Course] = []
    
    
    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.courses = self.courses
            }
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
            } catch  {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}





struct TestApi: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.courses, id: \.self) { course in
                    HStack {
                        Text(course.name)
                            .bold()
                    }
                }
            }
            .navigationTitle("Courses")
            .onAppear {
                viewModel.fetch()
                
            }
        }
    }
}

struct TestApi_Previews: PreviewProvider {
    static var previews: some View {
        TestApi()
    }
}
