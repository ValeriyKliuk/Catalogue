//
//  Shipping.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-29.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import Foundation

/// Shipping Method Enumeration
enum Shipping: String, Codable {
    /// Québec only
    case quebecOnly
    /// Free Shipping World Wide
    case freeWorldWide

    var description: String {
        switch self {
        case .quebecOnly:
            return "Free Quebec Shipping"
        case .freeWorldWide:
            return "Free Shipping World Wide"
        }
    }
}
