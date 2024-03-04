//
//  ContentView.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-03.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    @StateObject private var modelData = ModelData()
    
    var body: some View {
        NavigationStack {
            List(modelData.productWrapper.results) { product in
                Text(product.productName)
                
            }
            .navigationTitle("TASCH")
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    ContentView()
}
