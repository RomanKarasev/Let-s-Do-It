//
//  UiString + Capitalized.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import Foundation

extension String {
    
    static let start = "Start"
    static let pause = "Pause"
    static let resume = "Resume"
    
    
    
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
