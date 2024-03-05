//
//  ProductCellView.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-04.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import SwiftUI

@available(iOS 17.0, *)
struct ProductCellView: View {
    
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var sizeClass
#endif
    
    var product: ProductEntity
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .center){
                Image(product.bigImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: sizeClass == .regular ? 350 : 150)
                    .aspectRatio(contentMode: .fit)
                HStack {
                    Text(product.productName)
                }
            }
        }
        .padding(16)
        .background(.white)
        .clipShape(.rect(cornerRadius: 25))
        .shadow(radius: 1)
    }
}

@available(iOS 17.0, *)
#Preview {
    ProductCellView(product: ModelData().productWrapper.results[0])
}
