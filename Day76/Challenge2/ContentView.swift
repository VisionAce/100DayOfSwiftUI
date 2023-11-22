//
//  ContentView.swift
//  iExpense
//
//  Created by 褚宣德 on 2023/9/16.
//

import SwiftUI



struct ExpenseAmountStyle1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.brown)
    }
}

struct ExpenseAmountStyle2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.green)
            .bold()
    }
}

struct ExpenseAmountStyle3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.red)
            .bold()
            .font(.title3)
    }
}


struct expensesEditStyle: ViewModifier {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    func body(content: Content) -> some View {
        content
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

extension View {
    func expenseAmountStyle1Modifier() -> some View {
        modifier(ExpenseAmountStyle1())
    }
    func expenseAmountStyle2Modifier() -> some View {
        modifier(ExpenseAmountStyle2())
    }
    func expenseAmountStyle3Modifier() -> some View {
        modifier(ExpenseAmountStyle3())
    }
    
    func expensesEditStyleModifier() -> some View {
        modifier(expensesEditStyle())
    }
}

struct expensesEditBusineseView: View {
    @StateObject var expenses = Expenses()
    var body: some View {
        List {
            ForEach(expenses.items.filter { $0.type == "Businese" } ) { item in
                HStack {
                    if item.type == "Businese" {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        switch item.amount {
                        case 0...9:
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .expenseAmountStyle1Modifier()
                        case 10...99:
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .expenseAmountStyle2Modifier()
                        case 100...:
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .expenseAmountStyle3Modifier()
                        default:
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        
                    }
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("\(item.name) cost \(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                .accessibilityHint("\(item.type)")
            }
            .onDelete(perform: removeBusineseItems)
        }
    }
    func removeBusineseItems(at offsets: IndexSet) {
        // look at each item we are trying to delete
        for offset in offsets {
            // look in the personalItems array and get that specific item we are trying to delete. Find it's corresponding match in the expenses.items array.
            if let index = expenses.items.firstIndex(where: { $0.id == expenses.busineseItem[offset].id }) {
                // delete the item from the expenses.items array at the index you found its match
                expenses.items.remove(at: index)
            }
        }
    }
}


struct expensesEditPersonalView: View {
    @StateObject var expenses = Expenses()
    var body: some View {
        List {
            ForEach(expenses.items.filter { $0.type == "Personal" }) { item in
                HStack {
                    if item.type == "Personal" {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        
                        if item.amount < 10 {
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .expenseAmountStyle1Modifier()
                        } else if item.amount < 100 {
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .expenseAmountStyle2Modifier()
                        } else if item.amount > 99 {
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .expenseAmountStyle3Modifier()
                        } else {
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                    }
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("\(item.name) cost \(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                .accessibilityHint("\(item.type)")
                
            }
            .onDelete(perform: removePersonalItems)
        }
    }
    func removePersonalItems(at offsets: IndexSet) {
        for offset in offsets {
            if let index = expenses.items.firstIndex(where: { $0.id == expenses.personalItem[offset].id }) {
                expenses.items.remove(at: index)
            }
        }
    }
}


struct ContentView: View {
    // Remember, using @StateObject here asks SwiftUI to watch the object for any change announcements, so any time one of our @Published properties changes the view will refresh its body. It’s only used when creating a class instance – all other times you ‘ll use @ObservedObject instead.
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var expenseType = "Personal" 
    
    let expenseTypes = ["Businese", "Personal"]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Types" ,selection: $expenseType) {
                    ForEach(expenseTypes, id: \.self) {
                        Text($0)
                    }
                }
                .padding()
                .pickerStyle(.segmented)
                
                if expenseType == "Businese" {
                    expensesEditBusineseView()
                        .expensesEditStyleModifier()
                }
                if expenseType == "Personal" {
                    expensesEditPersonalView()
                        .expensesEditStyleModifier()
                }

            } // VStack
        }
    }
}

    

#Preview {
    ContentView()
}
