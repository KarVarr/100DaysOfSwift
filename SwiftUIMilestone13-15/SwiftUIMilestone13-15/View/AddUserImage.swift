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
                        .foregroundColor(Resources.AppColor.dark)
                }
                
                image?
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                
                Text(userName)
                    .padding()
                    .font(.title)
                
                Spacer()
                
                Button("Pick image") {
                    showingImagePicker = true
                }
                .padding()
                .background(Resources.AppColor.dark)
                .foregroundColor(.secondary)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .background(Resources.AppColor.main)
            
            .navigationTitle(Resources.String.AddUserImage.navTitle)
            .toolbar {
                Button {
                    saveDataUser()
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
        .alert(Resources.String.AddUserImage.Alert.title, isPresented: $showingAlert) {
            TextField(Resources.String.AddUserImage.Alert.textField, text: $userName)
            Button("Ok") {}
        } message: {
            Text(Resources.String.AddUserImage.Alert.message)
        }
        
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage()}
     
        .preferredColorScheme(.light)
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
