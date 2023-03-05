//
//  StepperView.swift
//  SwiftUIMilestone7-9
//
//  Created by Karen Vardanian on 05.03.2023.
//

import SwiftUI

struct StepperView: View {
    @Binding var completedTimes: Int
    
    var body: some View {
        Stepper("Completed \(completedTimes) time \(completedTimes == 1 ? "" : "s")", value: $completedTimes)
    }
}

struct StepperView_Previews: PreviewProvider {
    @State static var completedTimes = 0
    static var previews: some View {
        StepperView(completedTimes: $completedTimes)
    }
}


//Stepper(picker == 1 ? "Competed \(picker) time" : "Competed \(picker) times", value: $picker)
