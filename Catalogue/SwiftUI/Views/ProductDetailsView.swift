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
    
    var body: some View {
        NavigationStack {
            VStack( alignment: .center, spacing: 24) {
                product.bigImage
                HStack {
                    Text(product.price, format: .currency(code: "CAD"))
                        .font(.system(size: 32.0))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text("")
                        Text(product.shipping)
                            .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
                Rectangle()
                    .fill(.gray.gradient)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                
                Text(product.productDescription)
                    .padding(.horizontal, 8)
                
                HStack(alignment: .top, spacing: 32) {
                    Text("Colors")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(product.colors) { color in
                            Rectangle()
                            .fill(color.shapeStyle)
                            .frame(width: 56, height: 32, alignment: .center)
                            .clipShape(.rect(cornerRadius: 8))
                    }
                }
                .padding(.horizontal,16)
                
                HStack(alignment: .top) {
                    Text("Size")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text("H:\(product.height)\"")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("W:\(product.width)\"")
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("D:\(product.depth)\"")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.horizontal,16)
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .navigationTitle(product.productName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

@available(iOS 17.0, *)
#Preview {
    ProductDetailsView(product: ModelData().productWrapper.results[0])
}
