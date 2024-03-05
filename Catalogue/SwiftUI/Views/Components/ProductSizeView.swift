//
//  ProductSizeView.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-05.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct ProductSizeView: View {
    let height: Int
    let width: Int
    let depth: Int
    var body: some View {
        HStack(alignment: .top) {
            Text("Size")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                Text("H:\(height)\"")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("W:\(width)\"")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("D:\(depth)\"")
                    .frame(maxWidth: .infinity, alignment: .leading)
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
    ProductSizeView(height: 15, width: 14, depth: 13)
}
