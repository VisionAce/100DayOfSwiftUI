//
//  AddView.swift
//  iExpense
//
//  Created by 褚宣德 on 2023/9/21.
//

import SwiftUI

struct AddView: View {
    // So, what we’re going to do is add a property to AddView to store an Expenses object. It won’t create the object there, which means we need to use @ObservedObject rather than @StateObject.
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "personal"
    @State private var amount = 0.0
    
    let types = ["Businese", "Personal"]
    
    var body: some View {
        
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
        
    }
}

#Preview {
    AddView(expenses: Expenses())
}
