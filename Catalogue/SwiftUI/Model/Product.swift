//
//  Product.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-03.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import SwiftUI

struct Product: Codable, Identifiable {
    let productID: Int
    let price: Int
    let productName: String
    let productShortName: String
    let productDescription: String
    let productShortDescription: String
    let height: Int
    let width: Int
    let depth: Int
    let rating: Int
    let quantity: Int
    let shipping: String
    let imageName: String
    let bigImageName: String
    let colors: [ProductColor]
    
    var id: Int {
        productID
    }
    
    @available(iOS 13.0, *)
    var image: Image {
        Image(imageName)
    }
    
    @available(iOS 13.0, *)
    var bigImage: Image {
        Image(bigImageName)
    }
}
