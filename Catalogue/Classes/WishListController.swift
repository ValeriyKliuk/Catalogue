//
//  WishListController.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-30.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import Foundation


class WishListController {
    // reachable from other classes
    static let shared: WishListController = WishListController()
    
    // not reachable from other classes
    private init() {}
    
    var wishListItems: [Product] = []
    
    var total: Int {
        wishListItems.reduce(0) { partialResult, product in
            partialResult + product.price
        }
    }
    
    func isNew(id searchId: Int) -> Bool {
        wishListItems.index(where: {$0.productID == searchId}) == nil
    }
    
    func removeFromWishList(productId searchId: Int) {
        if let index = wishListItems.index(where: {$0.productID == searchId}){
            wishListItems.remove(at: index)
        }
    }

}
