//
//  Color+hexValue.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 18.09.25.
//

import Foundation
import SwiftUI

extension Color {
    
    public static let lightGray: Color = Color(hex: "#e9e9e9") // "#b8b8b8"
    public static let darkGray: Color = Color(hex: "#1F2020")
    public static let brickRed: Color = Color(hex: "#FF5757")
    
    
    init(hex: String,opacity:Double = 1) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r, g, b, a: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = (
                (int >> 8) * 17,
                (int >> 4 & 0xF) * 17,
                (int & 0xF) * 17,
                255
//                * UInt64(opacity)
            )
        case 6: // RGB (24-bit)
            (r, g, b, a) = (
                int >> 16,
                int >> 8 & 0xFF,
                int & 0xFF,
                255
//                * UInt64(opacity)
            )
        case 8: // ARGB (32-bit)
            (r, g, b, a) = (
                int >> 16 & 0xFF,
                int >> 8 & 0xFF,
                int & 0xFF,
                int >> 24
//                * UInt64(opacity)
            )
        default:
            (r, g, b, a) = (1, 1, 1, 1) // default white
//                            * UInt64(opacity))
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
//            opacity: Double(a) / 255
            opacity: opacity
        )
    }
}
