//
//  ViewController.swift
//  Project13Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//
import CoreImage
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    let myView = ViewForImage()
    let myImage = ImageView()
    let myLabel = LabelView()
    let mySlider = SliderView()
    let myButtonFilter = ButtonViewFilter()
    let myButtonSave = ButtonViewSave()
    let myStackViewHorizontalForSlider = StackViewHorizontalForSlider()
    let myStackViewHorizontalForButtons = StackViewHorizontalForButtons()
    
    let myLabelRadius = LabelView()
    let mySliderRadius = SliderView()
    let myStackViewSlider2 = StackViewHorizontalForSlider()
    
    var currentImage: UIImage!
    var context: CIContext!
    var currentFilter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        settings()
        layout()
    }
    
    
    func addViews() {
        view.addSubview(myView.uiView)
        view.addSubview(myImage.uiImageView)
        view.addSubview(myLabel.uiLabel)
        view.addSubview(mySlider.uiSlider)
        view.addSubview(myButtonFilter.uiButton)
        view.addSubview(myButtonSave.uiButton)
        view.addSubview(myStackViewHorizontalForSlider.stackView)
        view.addSubview(myStackViewHorizontalForButtons.stackView)
        
        view.addSubview(myLabelRadius.uiLabel)
        view.addSubview(mySliderRadius.uiSlider)
        view.addSubview(myStackViewSlider2.stackView)
    }
    
    func settings() {
        title = "Instafilter"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        
        view.backgroundColor = .white
        
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
        
        mySlider.uiSlider.addTarget(self, action: #selector(applyProcessing), for: .valueChanged)
        myButtonFilter.uiButton.addTarget(self, action: #selector(changeFilter), for: .touchUpInside)
        myButtonSave.uiButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        
        myLabelRadius.uiLabel.text = "Radius:    "
        mySliderRadius.uiSlider.addTarget(self, action: #selector(radiusSlider), for: .valueChanged)
        
        
        myStackViewHorizontalForSlider.stackView.addArrangedSubview(myLabel.uiLabel)
        myStackViewHorizontalForSlider.stackView.addArrangedSubview(mySlider.uiSlider)
        
        myStackViewSlider2.stackView.addArrangedSubview(myLabelRadius.uiLabel)
        myStackViewSlider2.stackView.addArrangedSubview(mySliderRadius.uiSlider)
        
        myStackViewHorizontalForButtons.stackView.addArrangedSubview(myButtonFilter.uiButton)
        myStackViewHorizontalForButtons.stackView.addArrangedSubview(myButtonSave.uiButton)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            myView.uiView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            myView.uiView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            myView.uiView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            myView.uiView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            
            myImage.uiImageView.topAnchor.constraint(equalTo: myView.uiView.topAnchor, constant: 10),
            myImage.uiImageView.leadingAnchor.constraint(equalTo: myView.uiView.leadingAnchor, constant: 10),
            myImage.uiImageView.trailingAnchor.constraint(equalTo: myView.uiView.trailingAnchor, constant: -10),
            myImage.uiImageView.bottomAnchor.constraint(equalTo: myView.uiView.bottomAnchor, constant: -10),
            
            myStackViewHorizontalForSlider.stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myStackViewHorizontalForSlider.stackView.topAnchor.constraint(equalTo: myView.uiView.bottomAnchor, constant: 10),
            myStackViewHorizontalForSlider.stackView.leadingAnchor.constraint(equalTo: myView.uiView.leadingAnchor, constant: 10),
            myStackViewHorizontalForSlider.stackView.trailingAnchor.constraint(equalTo: myView.uiView.trailingAnchor, constant: -10),
            
            
            myStackViewSlider2.stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myStackViewSlider2.stackView.topAnchor.constraint(equalTo: myStackViewHorizontalForSlider.stackView.bottomAnchor, constant: 10),
            myStackViewSlider2.stackView.leadingAnchor.constraint(equalTo: myView.uiView.leadingAnchor, constant: 10),
            myStackViewSlider2.stackView.trailingAnchor.constraint(equalTo: myView.uiView.trailingAnchor, constant: -10),
            
            myStackViewHorizontalForButtons.stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myStackViewHorizontalForButtons.stackView.topAnchor.constraint(equalTo: myStackViewSlider2.stackView.bottomAnchor, constant: 10),
            myStackViewHorizontalForButtons.stackView.leadingAnchor.constraint(equalTo: myView.uiView.leadingAnchor),
            myStackViewHorizontalForButtons.stackView.trailingAnchor.constraint(equalTo: myView.uiView.trailingAnchor),
            
            
            myButtonFilter.uiButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            myButtonFilter.uiButton.heightAnchor.constraint(equalToConstant: 44),
            
            myButtonSave.uiButton.widthAnchor.constraint(equalToConstant: 60),
            myButtonSave.uiButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
    
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        currentImage = image
        
        //Challenge 2 Project 15
        UIView.animate(withDuration: 1, delay: 0) {
            self.myImage.uiImageView.alpha = 1
        }
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        applyProcessing()
    }
    
    @objc func radiusSlider() {
       applyProcessing()
    }
    
    @objc func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        let value = mySlider.uiSlider.value
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(value, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(value * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(value * 10, forKey: kCIInputScaleKey) }
        if inputKeys.contains(kCIInputCenterKey) { currentFilter.setValue(CIVector(x: currentImage.size.width / 2, y: currentImage.size.height / 2), forKey: kCIInputCenterKey) }
        
        if let cgimg = context.createCGImage(currentFilter.outputImage!, from: currentFilter.outputImage!.extent) {
            let processedImage = UIImage(cgImage: cgimg)
            self.myImage.uiImageView.image = processedImage
        }
        
    }
    
    
    
    @objc func changeFilter() {
        let ac = UIAlertController(title: "Choose filter", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func setFilter(action: UIAlertAction) {
        guard currentImage != nil else { return }
        guard let actionTitle = action.title else { return }
        //Challenge 2
        myButtonFilter.uiButton.setTitle(actionTitle, for: .normal)
        currentFilter = CIFilter(name: actionTitle)
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        applyProcessing()
    }
    
    
    @objc func save() {
        guard let image = myImage.uiImageView.image else { return }
        
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
               let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
               ac.addAction(UIAlertAction(title: "OK", style: .default))
            //Challenge 1
               present(ac, animated: true)
           } else {
               let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
               ac.addAction(UIAlertAction(title: "OK", style: .default))
               present(ac, animated: true)
           }
    }
    
}

