//
//  LinkoTextField.swift
//  Linko
//
//  Created by Mohamed Sale7 on 06/08/2026.
//

import Foundation
import UIKit

class LinkoTextField: UITextField {

    private let textPadding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        textColor = .white
        
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.textFaint.cgColor
        tintColor = .primaryDarkOrange
        backgroundColor = .surface
        
        clipsToBounds = true
        
        autocorrectionType = .no
        spellCheckingType = .no
        smartQuotesType = .no
        smartDashesType = .no
        smartInsertDeleteType = .no

    }


    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
}
