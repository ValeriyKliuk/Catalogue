//
//  Utils.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-29.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import Foundation

class Utils {
    
    /// Converts String to ProductColor Enumeration
    static func convert(color string: String) -> ProductColor? {
        switch string {
        case "brown":
            return .brown
        case "blue":
            return .blue
        case "green":
            return .green
        case "orange":
            return .orange
        default:
            return nil
        }
    }
    
    /// Converts String to Shipping Enumeration
    static func convert(shipping string: String) -> Shipping {
        switch string {
        case "freeWorldWide":
            return .freeWorldWide
        default:
            return .quebecOnly
        }
    }
    
    /// Converting inches to centimeters
    static func convertToCentimeters(from inches: Int ) -> Int {
        let result: Double = Double(inches) * 2.64
        return Int(result)
    }
    
    
}


