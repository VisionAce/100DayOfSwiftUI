//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by 褚宣德 on 2023/10/14.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: SharedOrder
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var isFailedPlaceOrder = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.items.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isFailedPlaceOrder ? "Checkout failed." : "Thank you!", isPresented: isFailedPlaceOrder ? $isFailedPlaceOrder : $showingConfirmation) {
            Button("OK") {}
        } message: {
            if isFailedPlaceOrder {
                Text("Please ensure your internet connection.")
            } else {
                Text(confirmationMessage)
            }
        }
    }
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(SharedOrder.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(SharedOrder.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            
            showingConfirmation = true
        } catch {
            isFailedPlaceOrder = true
            print("Checkout failed.")
        }
    }
}

#Preview {
    NavigationStack {
        CheckoutView(order: SharedOrder())
    }
}
