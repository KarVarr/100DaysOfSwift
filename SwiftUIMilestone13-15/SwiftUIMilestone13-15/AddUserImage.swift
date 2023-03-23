//
//  AddUserImage.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 22.03.2023.
//

import SwiftUI

struct AddUserImage: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var userName = "User name"
    @State private var showingAlert = false
    @State private var showingImagePicker = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                if (image == nil) {
                    Image(systemName: "questionmark.square")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                        .padding()
                        .foregroundColor(.orange)
                }
                
                image?
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 400)
                    .padding()
                
                Text(userName)
                    .padding()
                    .font(.title)
                
                Spacer()
                
                Button("Pick image") {
                    showingImagePicker = true
                }
                .padding()
                .background(.mint)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .navigationTitle("Add a photo")
            .toolbar {
                Button {
                    
                } label: {
                    Text("Save")
                }

            }
        }
        .alert("User Name", isPresented: $showingAlert) {
            TextField("Enter your name", text: $userName)
            Button("Ok") {}
        } message: {
            Text("Please write your name")
        }
        
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage()}
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
        showingAlert = true
    }
    
}

struct AddUserImage_Previews: PreviewProvider {
    static var previews: some View {
        AddUserImage()
    }
}
