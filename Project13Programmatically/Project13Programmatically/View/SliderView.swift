//
//  SliderView.swift
//  Project13Programmatically
//
//  Created by Karen Vardanian on 26.04.2023.
//

import UIKit

class SliderView {
    let uiSlider: UISlider = {
       let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0.5
        return slider
    }()
}
