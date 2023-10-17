//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by 褚宣德 on 2023/10/14.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: SharedOrder
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.items.name)
                TextField("street address", text: $order.items.streetAddress)
                TextField("City", text: $order.items.city)
                TextField("Zip", text: $order.items.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(order.hasVaildAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AddressView(order: SharedOrder())
    }
}
