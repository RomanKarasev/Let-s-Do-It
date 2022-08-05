//
//  UiKit + UiLabel.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont?, alignment: NSTextAlignment) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = .label
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
