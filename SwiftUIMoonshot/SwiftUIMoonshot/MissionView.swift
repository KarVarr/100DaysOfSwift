//
//  MissionView.swift
//  SwiftUIMoonshot
//
//  Created by Karen Vardanian on 27.02.2023.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    //Challenge 2
                    ImageView(mission: mission)
                        .frame(maxWidth: geometry.size.width * 0.75)
                        .accessibilityLabel("Image \(mission.image)")
                    //Challenge 1
                    Text("Launch date:  \(mission.formattedLaunchDate)")
                    
                   
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                             .frame(height: 2)
                             .foregroundColor(.lightBackground)
                             .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title2.bold())
                            .padding(.bottom, 5)
                            .accessibilityLabel("Mission Highlights")
                        
                        Text(mission.description)
                            .accessibilityLabel("Mission description \(mission.description)")
                        
                        Rectangle()
                             .frame(height: 2)
                             .foregroundColor(.lightBackground)
                             .padding(.vertical)
                        
                        Text("Crew of \(mission.displayName)")
                            .font(.title2.bold())
                            .padding(.bottom, 5)
                    }
                    .padding([.bottom, .horizontal])
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    HStack {
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(Capsule())
                                            .overlay (
                                                Capsule()
                                                    .strokeBorder(.white,
                                                    lineWidth: 1)
                                            )
                                            .padding(.trailing, 5)
                                            .accessibilityLabel("Logo id name \(crewMember.astronaut.id)")
                                        VStack(alignment: .leading) {
                                            Text(crewMember.astronaut.name)
                                                .foregroundColor(.mint)
                                                .font(.headline)
                                                .accessibilityLabel("Astronaut name is  \(crewMember.astronaut.name)")
                                            Text(crewMember.role)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    
                }
                .padding([.bottom])
                
                
            }
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
            
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
        
    
    
    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
