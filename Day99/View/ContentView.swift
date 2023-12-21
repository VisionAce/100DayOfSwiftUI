//
//  ContentView.swift
//  SnowSeeker
//
//  Created by 褚宣德 on 2023/12/18.
//

import SwiftUI

enum SortType {
    case none, nameSort, countrySort, runsSort
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    @State private var showingSort = false
    @State private var sortType: SortType = .none
    
    
    var body: some View {
        NavigationStack {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                    
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem {
                    Button {
                        showingSort = true
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                    }
                }
            }
            .confirmationDialog("Sort", isPresented: $showingSort) {
                Button("Name") {
                    sortType = .nameSort
                }
                Button("Country") {
                    sortType = .countrySort
                }
                
                Button("Runs") {
                    sortType = .runsSort
                }
            }
            
        }
        .environmentObject(favorites)
    }
    
    
    var sortresorts: [Resort] {
        switch sortType {
        case .none:
            return resorts
        case .nameSort:
            return resorts.sorted { $0.name < $1.name }
        case .countrySort:
            return resorts.sorted { $0.country < $1.country }
        case .runsSort:
            return resorts.sorted { $0.runs < $1.runs }
        }
    }
    
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return sortresorts
        } else {
            return sortresorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}


#Preview {
    
    ContentView()
}
