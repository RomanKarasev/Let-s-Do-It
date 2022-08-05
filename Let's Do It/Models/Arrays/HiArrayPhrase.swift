//
//  HiArrayPhrase.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class Arrays {
    
    let phraseArray = ["Let's make your day productive", "Become the best version of yourself", "The pain of discipline or the pain of regret"]
    
    
    func getPhrase() -> String {
        let textPhrase = phraseArray.randomElement()!
        return textPhrase
    }
}
