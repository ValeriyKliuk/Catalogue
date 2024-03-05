//
//  Product.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-05.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import Foundation

protocol Product {
    var productID: Int { get }
    var price: Int { get }
    var productName: String { get }
    var productShortName: String { get }
    var productDescription: String { get }
    var productShortDescription: String { get }
    var height: Int { get }
    var width: Int { get }
    var depth: Int { get }
    var rating: Int { get }
    var quantity: Int { get }
    var shipping: Shipping { get }
    var imageName: String { get }
    var bigImageName: String { get }
    var colors: [ProductColor] { get }
}
