//
//  ProductViewModel.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-05-01.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import Foundation

class ProductViewModel {
    
    private var product: CatalogueItem
    
    var rating: Int
    var sizeHeight: String
    var sizeWidth: String
    var sizeDepth: String
    var productPrice: String
    var productName: String
    var shippingMethod: String
    var fullDescription: String
    var bigImage: String
    var colors: [ProductColor]
    var isNew: Bool = false
    var productID: Int
    
    init(product: CatalogueItem) {
        self.product = product

        let h = Utils.convertToCentimeters(from: (product.height))
        let w = Utils.convertToCentimeters(from: (product.width))
        let d = Utils.convertToCentimeters(from: (product.depth))
        
        sizeHeight = "H:\(h)cm/\(String(describing: product.height))\""
        sizeWidth = "W:\(w)cm/\(String(describing: product.width))\""
        sizeDepth = "D:\(d)cm/\(String(describing: product.depth))\""
        
        productPrice = "$ \(product.price) "
        productName = product.productName
        
        shippingMethod = Utils.convert(shipping: product.shipping)
        
        fullDescription = product.productDescription
        
        colors = product.colors
        rating = product.rating
        
        bigImage = product.bigImageName
        productID = product.productID
        
        isNew = WishListController.shared.isWishListHasProduct(id: product.productID)
    }
    
    func getCurrentProduct() -> CatalogueItem {
        return product
    }
}

