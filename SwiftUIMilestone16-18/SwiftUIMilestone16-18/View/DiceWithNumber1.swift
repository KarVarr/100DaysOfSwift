//
//  DiceWithNumber1.swift
//  SwiftUIMilestone16-18
//
//  Created by Karen Vardanian on 09.04.2023.
//

import SwiftUI

struct DiceWithNumber1: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.green)
                .shadow(radius: 6, x: 10, y: 10)
                .frame(maxWidth: 200, maxHeight: 200)
            
            Circle()
                .fill(.white)
                .frame(width: 30, height: 30)
            
        }
    }
}

struct DiceWithNumber1_Previews: PreviewProvider {
    static var previews: some View {
        DiceWithNumber1()
    }
}
