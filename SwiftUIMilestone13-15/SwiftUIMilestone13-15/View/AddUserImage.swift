//
//  AddUserImage.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 22.03.2023.
//
import CoreData
import SwiftUI

struct AddUserImage: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var userName = ""
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
                    .scaledToFit()
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
            .background(.indigo.opacity(0.34))
            .navigationTitle("Add a photo")
            .toolbar {
                Button {
                    saveDataUser()
                    dismiss()
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
    
    func saveDataUser () {
        guard let inputImage = inputImage, let imageData = inputImage.jpegData(compressionQuality: 1.0) else { return }
        
        let user = UserData(context: moc)
        user.id = UUID()
        user.name = userName
        user.userPhoto = imageData
        
        
        try? moc.save()
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
