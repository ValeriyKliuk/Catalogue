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
    
    var wishListItems: [Product] = [] {
        didSet {
            updateTotal()
        }
    }
    
    var total: Int = 0
    
    func updateTotal() {
        var sum: Int = 0
        for product in wishListItems {
            sum += product.price
        }
        self.total = sum
    }
    
    func isWishListHasProduct(id searchId: Int) -> Bool {
        let result: Bool = true
        for product in wishListItems {
            if product.productID == searchId {
                return false
            }
        }
        return result
    }
    
    func removeFromWishList(productId searchId: Int) {
        if let index = wishListItems.index(where: {$0.productID == searchId}){
            wishListItems.remove(at: index)
        }
    }

}
