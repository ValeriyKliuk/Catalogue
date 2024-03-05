//
//  ProductCardView.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-05.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import SwiftUI

@available(iOS 17.0, *)
struct ProductCardView: View {
    var product: Product

    var body: some View {
        VStack {
            Image(product.bigImageName)
            HStack {
                Text(product.price, format: .currency(code: "CAD"))
                    .font(.system(size: 32.0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
                    Text("")
                    Text(product.shipping.description)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .padding(.top, 16)
            
            Rectangle()
                .fill(.gray.secondary)
                .frame(height: 1)
                .frame(maxWidth: .infinity)
            
            Text(product.productDescription)
                .padding(.top, 8)
        }
        .padding(16)
        .background(.white)
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 1)
    }
}


@available(iOS 17.0, *)
#Preview {
    ProductCardView(product: ModelData().productWrapper.results[2])
}
