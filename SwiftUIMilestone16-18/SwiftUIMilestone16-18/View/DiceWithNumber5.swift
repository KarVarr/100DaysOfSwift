//
//  DiceWithNumber5.swift
//  SwiftUIMilestone16-18
//
//  Created by Karen Vardanian on 09.04.2023.
//

import SwiftUI

struct DiceWithNumber5: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.green)
                .shadow(radius: 6, x: 10, y: 10)
                .frame(maxWidth: 200, maxHeight: 200)
            
            Circle()
                .fill(.white)
                .frame(width: 30, height: 30)
         
            
            Circle()
                .fill(.white)
                .frame(width: 30, height: 30)
                .offset(x: 60.0, y: 60.0)
            
            Circle()
                .fill(.white)
                .frame(width: 30, height: 30)
                .offset(x: -60.0, y: -60.0)
            
            Circle()
                .fill(.white)
                .frame(width: 30, height: 30)
                .offset(x: -60.0, y: 60.0)
            
            Circle()
                .fill(.white)
                .frame(width: 30, height: 30)
                .offset(x: 60.0, y: -60.0)
        }
    }
}

struct DiceWithNumber5_Previews: PreviewProvider {
    static var previews: some View {
        DiceWithNumber5()
    }
}
