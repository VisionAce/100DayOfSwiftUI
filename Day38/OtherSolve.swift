//
//  OtherSolve.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/30.
//


import SwiftUI

struct SwiftHuView : View {
    @StateObject var expenses = Expenses() // an existing instance
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("刪除全部") {
                    expenses.items.removeAll()
                }
                List {
                    // no longer needs to tell ForEach which one is unique because with identifiable, ForEach knows id is unique
                    Section(header: Text("Businese costs")) {
                        ForEach(expenses.items.filter {$0.type == "Businese" }) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name).font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                // Challenges 1 and 2, format and conditional coloring
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "zh-Hant-HK"))
                                    .foregroundColor(item.amount < 10 ? .red : item.amount > 100 ? .blue : .orange)
                            }
                        }
                        .onDelete(perform: removeBusinessItems)
                    }
                    
                    Section(header: Text("Personal costs")) {
                        ForEach(expenses.items.filter {$0.type == "Personal" }) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name).font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                // Challenges 1 and 2, format and conditional coloring
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "zh-Hant-HK"))
                                    .foregroundColor(item.amount < 10 ? .red : item.amount > 100 ? .blue : .orange)
                            }
                        }
                        .onDelete(perform: removePersonalItems)
                    }
                }
                .navigationTitle("iExpense")
                .toolbar {
                    Button {
                        showingAddExpense.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: expenses)
                }
            } // VStack
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        for offset in offsets {
            if let index = expenses.items.firstIndex(where: { $0.id == expenses.personalItem[offset].id }) {
                expenses.items.remove(at: index)
            }
        }
        
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        for offset in offsets {
            if let index = expenses.items.firstIndex(where: { $0.id == expenses.busineseItem[offset].id }) {
                expenses.items.remove(at: index)
            }
        }
    }
    
}

#Preview {
    SwiftHuView()
}
