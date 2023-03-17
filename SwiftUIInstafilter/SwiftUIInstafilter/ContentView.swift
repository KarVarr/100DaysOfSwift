//
//  ContentView.swift
//  SwiftUIInstafilter
//
//  Created by Karen Vardanian on 17.03.2023.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var rangeSlider = 0.5
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Slider(value: $rangeSlider, in: 0...1)
                .onChange(of: rangeSlider) { newValue in
                    print("\(newValue)")
                    loadImage()
                }
        }
        .onAppear(perform: loadImage)
        

    }
    
    
    func loadImage() {
        guard let inputImage = UIImage(named: "Unknown") else {return}
        let beginImage = CIImage(image: inputImage)
     
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        
        currentFilter.inputImage = beginImage
        currentFilter.intensity = Float(rangeSlider)
        
        guard let outputImage = currentFilter.outputImage else {return}
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
