//
//  SkiDetialView.swift
//  SnowSeeker
//
//  Created by 褚宣德 on 2023/12/19.
//

import SwiftUI

struct SkiDetialView: View {
    let resort: Resort
    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                Text("\(resort.elevation)m")
                    .font(.title3)
            }
            
            VStack {
                Text("Snow")
                    .font(.caption.bold())
                Text("\(resort.snowDepth)")
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SkiDetialView(resort: Resort.example)
}
