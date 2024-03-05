//
//  ProductActionButtonView.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-05.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import SwiftUI

@available(iOS 17.0.0, *)
struct ProductActionButtonView: View {
    let title: String
    let isAdd: Bool
    var updateFavoriteProduct: (() -> Void)?

    var body: some View {
        Button(title, systemImage: isAdd ? "heart" : "heart.slash") {
            if let updateFavoriteProduct {
                updateFavoriteProduct()
            }
        }
        .buttonStyle(.bordered)
        .foregroundStyle(.white)
        .font(.title2)
        .background(isAdd ? .blue : .red, in: .buttonBorder)
        .padding(8)
    }
}

@available(iOS 17.0.0, *)
#Preview {
    ProductActionButtonView(title: "Add", isAdd: true)
}
