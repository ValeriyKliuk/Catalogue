//
// Created by Valeriy Kliuk
// Copyright (c) 2017 Valeriy Kliuk. All rights reserved.
//

import Foundation
import SwiftyJSON

/// CatalogueItem
struct CatalogueItem: CustomStringConvertible {
    // MARK: - Attributes

    /// Product ID
    let productID: Int
    /// Price
    let price: Int
    /// Name
    let productName: String
    /// Short Name
    let productShortName: String
    /// Description
    let productDescription: String
    /// Short Description
    let productShortDescription: String
    /// Colors
    let colors: [ProductColor]
    /// Height
    let height: Int
    /// Width
    let width: Int
    /// Depth
    let depth: Int
    /// Rate
    let rating: Int
    /// Available quantity
    let quantity: Int
    /// Shipping Method
    let shipping: Shipping
    /// Image
    let imageName: String
    /// Big Image
    let bigImageName: String
    
    public var description: String {
        return "CatalogueItem: \(productID) \(productName) $\(price))"
    }

}

/// CatalogueItem extension
extension CatalogueItem {

    /// Build CatalogueItem from json
    static func build(from json: JSON) -> CatalogueItem {
        
        // MARK: - ProductColor converiosn
        
        var productColorArray: [ProductColor] = []
        let colorArray: [String] = json["colors"].arrayValue.map({$0.stringValue})
        
        for colorString in colorArray {
            if let color = Utils.convert(color: colorString) {
                productColorArray.append(color)
            }
        }
        
        // MARK: - Shipping converiosn

        var ship: Shipping = .quebecOnly
        
        if let shippingString = json["shipping"].string {
            ship = Utils.convert(shipping: shippingString)
        }

        // MARK: - create CatalogueItem
        
        return CatalogueItem (productID: json["productID"].int ?? 0,
                              price: json["price"].int ?? 0,
                              productName: json["productName"].string ?? "",
                              productShortName: json["productShortName"].string ?? "",
                              productDescription: json["productDescription"].string ?? "",
                              productShortDescription: json["productShortDescription"].string ?? "",
                              colors: productColorArray,
                              height: json["height"].int ?? 0,
                              width: json["width"].int ?? 0,
                              depth:  json["depth"].int ?? 0,
                              rating: json["rating"].int ?? 0,
                              quantity: json["quantity"].int ?? 0,
                              shipping: ship,
                              imageName: json["imageName"].string ?? "",
                              bigImageName: json["bigImageName"].string ?? "")
    }
}





