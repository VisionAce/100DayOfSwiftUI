//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by 褚宣德 on 2023/10/13.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = SharedOrder()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.items.type) {
                        ForEach(SharedOrder.types.indices, id: \.self) {
                            Text(SharedOrder.types[$0])
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
                
            }
            .navigationTitle("Cupcake Corner")
           
        }
 
    }
   
}

#Preview {
    ContentView()
}
