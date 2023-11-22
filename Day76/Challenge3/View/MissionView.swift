//
//  MissionView.swift
//  Moonshot
//
//  Created by 褚宣德 on 2023/10/2.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

struct CrewMemberView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let mission: Mission
    let crew: [CrewMember]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
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
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding(.horizontal)
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("\(crewMember.astronaut.name) is \(crewMember.role)")
                    }
                }
            }
        }
        .scrollClipDisabled(true)
        .padding()
    }
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}


struct MissionView: View {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(decorative: mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.launchDate?.formatted(.dateTime.year().month().day()) ?? "")
                    //                    Text(mission.formattedLaunchDate)
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    
                    //                    Divider()
                    VStack(alignment: .leading) {
                        DividerView()
                            .accessibilityHidden(true)
                        
                        Text("Mission Hightlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        DividerView()
                            .accessibilityHidden(true)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                    }
                    .padding(.horizontal)
                    
                    CrewMemberView(mission: mission, astronauts: MissionView.astronauts)
                        .accessibilityAddTraits(.isButton)
                 
                }
                .padding(.bottom)
            }
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}


struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
        // This view will automatically have a dark color scheme because it’s applied to the NavigationView in ContentView, but the MissionView preview doesn’t know that so we need to enable it by hand.
            .preferredColorScheme(.dark)
    }
}

struct CrewMemberView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        CrewMemberView(mission: missions[0], astronauts: astronauts)
        // This view will automatically have a dark color scheme because it’s applied to the NavigationView in ContentView, but the MissionView preview doesn’t know that so we need to enable it by hand.
            .preferredColorScheme(.dark)
    }
}
