//
//  UserDetailView.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 22.03.2023.
//
import MapKit
import SwiftUI

struct UserDetailView: View {
    let name: String
    let image: Image
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                ZStack(alignment: .bottomTrailing) {
                    
                    image
                        .resizable()
                        .frame(maxWidth: geo.size.width, maxHeight: geo.size.height / 2.5)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .shadow(color: .black, radius: 5, x: 4, y: 4)
                        .padding(.horizontal, 10)
                    
                    Text(name)
                        .padding()
                        .background(Resources.AppColor.secondary.opacity(0.8))
                        .foregroundColor(.secondary)
                        .font(.largeTitle)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding()
                        .fixedSize()
                    
                }
                .padding(.bottom, 30)
                //                Spacer()
                //MARK: - MAP
                Text("The place where you met")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Resources.AppColor.secondary.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.bottom, 30)
                Map(coordinateRegion: $mapRegion)
                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.height / 2.5)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .shadow(color: .black, radius: 5, x: 4, y: 4)
                    .padding(.horizontal, 10)
                
            }
            .padding(.top)
            .background(image.resizable().scaledToFill().blur(radius: 30))
            .background(Resources.AppColor.light)
            .preferredColorScheme(.light)
            .navigationTitle("User Info")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(name: "User", image: Image(systemName: "questionmark.square"))
    }
}
