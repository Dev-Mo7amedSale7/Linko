//
//  Colors.swift
//  khadmati_ios
//
//  Created by Mohamed Sale7 on 30/07/2026.
//

import UIKit

extension UIColor {
    // Primary Colors
    static let primaryOrange = UIColor(hex: "#E05F00")
    static let primaryDark = UIColor(red: 230/255, green: 100/255, blue: 50/255, alpha: 1.0)
    static let primaryLight = UIColor(red: 255/255, green: 160/255, blue: 122/255, alpha: 1.0)
    
    // Background Colors
    static let backgroundPrimary = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1.0)
    static let cardBackground = UIColor.white
    
    // Text Colors
    static let textPrimary = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.0)
    static let textSecondary = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1.0)
    static let textTertiary = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1.0)
    
    // Border Colors
    static let borderLight = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
    static let borderMedium = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
    
    // Status Colors
    static let success = UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0)
    static let error = UIColor(red: 244/255, green: 67/255, blue: 54/255, alpha: 1.0)
    static let warning = UIColor(red: 255/255, green: 152/255, blue: 0/255, alpha: 1.0)
}


import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexString = hexString.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(
            red: red,
            green: green,
            blue: blue,
            alpha: alpha
        )
    }
}
