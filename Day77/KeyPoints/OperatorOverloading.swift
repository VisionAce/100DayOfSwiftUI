//
//  OperatorOverloading.swift
//  MyPhoto
//
//  Created by 褚宣德 on 2023/11/23.
//

import SwiftUI


extension BinaryInteger {
    static func *(lhs: Self, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }
    
    static func *(lhs: Double, rhs: Self) -> Double {
        return lhs * Double(rhs)
    }
}


struct OperatorOverloadingView: View {
    @State private var result: Double = 0.0
    let exampleInt: Int64 = 50_000_000_000_000_001
    
    var body: some View {
        Form {
            Section {
                Text("\(exampleInt)")
                Text("Number of digits: \(String(exampleInt).count)")
            }
            Section {
                Text("\(exampleInt) X 1.0 = \(String(format: "%.0f", result))")
                Text("Number of digits: \(String(format: "%.0f", result).count)")
            }
            Text("結果不相等,經運算後少了 1")
        }
        .onAppear {
            result = exampleInt * 1.0
        }
    }
}

#Preview {
    OperatorOverloadingView()
}
