//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by 褚宣德 on 2023/10/24.
//
import CoreData
import SwiftUI

enum NSPredicateString: String {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS"
    case containsCI = "CONTAINS[c]"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fechRequest: FetchedResults<T>

    let content: (T) -> Content
    
    var body: some View {
        List(fechRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, predicateString: String, sortDescriptors: [SortDescriptor<T>] = [], content: @escaping (T) -> Content) {
        _fechRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicateString) %@", filterKey, filterValue))
        self.content = content
    }
}

