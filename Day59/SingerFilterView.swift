//
//  ContentView.swift
//  CoreDataProject
//
//  Created by 褚宣德 on 2023/10/23.
//
import CoreData
import SwiftUI

struct SingerFilterView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    @State private var filterType = NSPredicateString.contains.rawValue
    @State private var sortDescriptors = [SortDescriptor<Singer>]()
    
    let filterTypes = [NSPredicateString.beginsWith.rawValue, NSPredicateString.contains.rawValue, NSPredicateString.containsCI.rawValue]
    
    
    var body: some View {
        VStack {
            // list of matching singers
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, predicateString: filterType, sortDescriptors: sortDescriptors) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Picker("filterType", selection: $filterType) {
                ForEach(filterTypes, id: \.self) {
                    Text($0)
                }
            }
            
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
            
            Button("Sort A-Z") {
                sortDescriptors = [SortDescriptor<Singer>(\.firstName)]
            }
            Button("Sort Z-A") {
                sortDescriptors = [SortDescriptor<Singer>(\.firstName, order: .reverse)]
            }

        }
    }
}

#Preview {
    SingerFilterView()
}
