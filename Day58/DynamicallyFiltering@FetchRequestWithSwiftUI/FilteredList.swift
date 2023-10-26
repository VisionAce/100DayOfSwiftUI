//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by 褚宣德 on 2023/10/24.
//
import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fechRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fechRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, content: @escaping (T) -> Content) {
        _fechRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

