//
//  Filtering@FetchRequestUsingNSPredicate.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/24.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc

    /*
     `%@` means “insert some data here”, and allows us to provide that data as a parameter to the predicate rather than inline.
     
     NSPredicate(format: "universe == %@", "Star Wars"))
    
 
     `==`, `<` and `>` :
    
     NSPredicate(format: "name < %@", "F"))
    
     
     `IN`:
     
     NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
    
     
     `BEGINSWITH` and `CONTAINS`:
     
     NSPredicate(format: "name BEGINSWITH %@", "E"))
     
     
     That predicate is case-sensitive; if you want to ignore case you need to modify it to this:
     
     NSPredicate(format: "name BEGINSWITH[c] %@", "e"))
     
     
     CONTAINS[c] works similarly, except rather than starting with your substring it can be anywhere inside the attribute.
     
     
     `NOT`:
     
     NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e"))
     
     
     If you need more complicated predicates, join them using `AND` to build up as much precision as you need, or add an import for Core Data and take a look at `NSCompoundPredicate` – it lets you build one predicate out of several smaller ones.
     
    */
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@" , "e")) var ships:FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id:\.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
        }
    }
}

#Preview {
    ContentView()
}
