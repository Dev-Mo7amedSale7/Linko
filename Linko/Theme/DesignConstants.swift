//
//  DesignConstants.swift
//  khadmati_ios
//
//  Created by Mohamed Sale7 on 30/07/2026.
//

import UIKit

struct DesignConstants {
    
    // Spacing
    static let spacingXS: CGFloat = 8
    static let spacingS: CGFloat = 12
    static let spacingM: CGFloat = 16
    static let spacingL: CGFloat = 24
    static let spacingXL: CGFloat = 32
    static let spacingXXL: CGFloat = 48
    
    // Corner Radius
    static let cornerRadiusS: CGFloat = 8
    static let cornerRadiusM: CGFloat = 12
    static let cornerRadiusL: CGFloat = 16
    static let cornerRadiusXL: CGFloat = 24
    
    // Font Sizes
    static let fontSizeXS: CGFloat = 12
    static let fontSizeS: CGFloat = 14
    static let fontSizeM: CGFloat = 16
    static let fontSizeL: CGFloat = 18
    static let fontSizeXL: CGFloat = 24
    static let fontSizeXXL: CGFloat = 32
    
    // Button Heights
    static let buttonHeightS: CGFloat = 44
    static let buttonHeightM: CGFloat = 50
    static let buttonHeightL: CGFloat = 56
    
    // Text Field Heights
    static let textFieldHeight: CGFloat = 56
    
    // Shadows
    static let shadowLight: NSShadow = {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.05)
        shadow.shadowOffset = CGSize(width: 0, height: 2)
        shadow.shadowBlurRadius = 8
        return shadow
    }()
    
    static let shadowMedium: NSShadow = {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.1)
        shadow.shadowOffset = CGSize(width: 0, height: 4)
        shadow.shadowBlurRadius = 12
        return shadow
    }()
}
