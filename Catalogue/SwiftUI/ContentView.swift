//
//  ContentView.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-03.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    @StateObject private var modelData = ModelData()
    
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var sizeClass
#endif
    var body: some View {
        NavigationStack {
            ScrollView {
                Section("Product catalogue") {
                    
                    if modelData.productWrapper.results.isEmpty {
                        ContentUnavailableView("No products", systemImage: "cart.fill.badge.questionmark")
                    } else {
                        ScrollView(.horizontal) {
                            HStack(spacing: 10.0) {
                                ForEach(modelData.productWrapper.results) { product in
                                    NavigationLink {
                                        ProductDetailsView(product: product)
                                    } label: {
                                        ProductCellView(product: product)
                                    }
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .scrollIndicators(.hidden)
                        .contentMargins(sizeClass == .regular ? 20 : 10, for: .scrollContent)
                        .listRowInsets(EdgeInsets())
                    }
                }
            }
            .navigationTitle("TASCH")
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    ContentView()
}
