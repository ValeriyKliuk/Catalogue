//
//  ProductColor.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-29.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import Foundation
import SwiftUI

/// Product Color
enum ProductColor: String, Codable, Identifiable {
    
    /// Blue
    case blue
    /// Brown
    case brown
    /// Green
    case green
    /// Orange
    case orange
    
    var id: ProductColor {
        self
    }

    @available(iOS 17.0, *)
    var shapeStyle: some ShapeStyle {
        switch self {
        case .blue:
            return Color.blue
        case .brown:
            return Color.brown
        case .green:
            return Color.green
        case .orange:
            return Color.orange
        }
    }
}
