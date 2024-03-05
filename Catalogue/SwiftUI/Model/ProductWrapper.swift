//
//  ProductWrapper.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-03.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import Foundation

struct ProductWrapper: Codable {
    let resultCount: Int
    let results: [ProductEntity]
}
