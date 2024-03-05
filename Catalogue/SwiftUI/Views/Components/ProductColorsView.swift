//
//  ProductColorsView.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-05.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import SwiftUI


@available(iOS 17.0, *)
struct ProductColorsView: View {
    let colors: [ProductColor]

    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            Text("Colors")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(colors) { color in
                Rectangle()
                    .fill(color.shapeStyle)
                    .frame(width: 56, height: 32, alignment: .center)
                    .clipShape(.rect(cornerRadius: 8))
            }
        }
        .padding(16)
        .background(.white)
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 1)
    }
}

@available(iOS 17.0, *)
#Preview {
    ProductColorsView(colors: [.orange, .blue, .green])
}

