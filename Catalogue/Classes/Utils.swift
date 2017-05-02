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
    
    /// Converts Shipping Enumeration to the String
    static func convert(shipping value: Shipping) -> String {
        switch value {
        case .freeWorldWide:
            return "Free Shipping World Wide"
        default:
            return "Free Quebec Shipping"
        }
    }
    
    /// Converting inches to centimeters
    static func convertToCentimeters(from inches: Int ) -> Int {
        let result: Double = Double(inches) * 2.64
        return Int(result)
    }
    
    
}


