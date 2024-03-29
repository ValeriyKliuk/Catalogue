//
//  ProductDetailsView.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-04.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import SwiftUI

@available(iOS 17.0, *)
struct ProductDetailsView: View {
    var product: Product
    @State private var rating: Int?
    @State private var isNew: Bool = true
    
    private var actionButtonTitle: String {
        isNew ? "Add to wish list" : "Remove from wish list"
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack( alignment: .center, spacing: 24) {
                    ProductCardView(product: product)
                        .padding(.horizontal, 16)
                    
                    ProductColorsView(colors: product.colors)
                        .padding(.horizontal, 16)
                    
                    ProductSizeView(height: product.height, width: product.width, depth: product.depth)
                        .padding(.horizontal, 16)
                    
                    ProductRatingView(rating: $rating, title: "Rate the product")
                        .padding(.horizontal, 16)
                    
                    Spacer(minLength: 8)
                }
            }
            
            ProductActionButtonView(title: actionButtonTitle, isNew: $isNew) {
                // TODO: add action here
            }
                .onAppear{
                    self.rating = self.product.rating
                }
                .navigationTitle(product.productName)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    ProductDetailsView(product: ModelData().productWrapper.results[0])
}
