//
//  iExpenseContentView.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/21.
//

import SwiftUI

struct ContentView: View {
    // Remember, using @StateObject here asks SwiftUI to watch the object for any change announcements, so any time one of our @Published properties changes the view will refresh its body. It’s only used when creating a class instance – all other times you ‘ll use @ObservedObject instead.
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
   
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                  showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

    

#Preview {
    ContentView()
}
