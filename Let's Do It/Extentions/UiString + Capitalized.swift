//
//  UiString + Capitalized.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
