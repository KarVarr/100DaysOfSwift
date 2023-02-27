//
//  ImageView.swift
//  SwiftUIMoonshot
//
//  Created by Karen Vardanian on 27.02.2023.
//

import SwiftUI

struct ImageView: View {
    let mission: Mission
    
    var body: some View {
        //Challenge 2
        Image(mission.image)
            .resizable()
            .scaledToFit()
            .padding([.top, .bottom])
    }
}

struct ImageView_Previews: PreviewProvider {
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ImageView(mission: missions[1])
    }
}
