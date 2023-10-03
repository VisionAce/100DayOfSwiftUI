//
//  ContentView.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/3.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGrid = false
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    ContentGridView()
                } else {
                    ContentListView()
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem {
                    Toggle(showingGrid ? "Show List" : "Show Grid", isOn: $showingGrid)
                        .foregroundColor(.primary)
                }
                
            }
        }
    }
}

struct ContentGridView: View {
    let astronaunts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(mission) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronaunts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text("Launch Date\n\(mission.formattedLaunchDate)")
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground,lineWidth: 2)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            
        }
        
    }
}



struct ContentListView: View {
    let astronaunts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack {
            List {
                ForEach(mission) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronaunts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .background(.lightBackground)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text("Launch Date\n\(mission.formattedLaunchDate)")
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .background(.lightBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.indigo,lineWidth: 2)
                                
                        )
                    }
                }
            }
            .listStyle(.plain)
            .listRowBackground(Color.darkBackground)
            
        }
    }
}



#Preview {
    ContentView()
}


#Preview("ContentListView") {
    ContentListView()
        .preferredColorScheme(.dark)
}

#Preview("ContentGridtView") {
    ContentGridView()
        .preferredColorScheme(.dark)
}


