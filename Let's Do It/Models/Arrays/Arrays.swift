//
//  HiArrayPhrase.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class Arrays {
    
    // MARK: Properties
    
    
    // 
    static let phraseArray = ["Let's make your day productive",
                       "Become the best version of yourself",
                       "The pain of discipline or the pain of regret"
    ]
    
    static let nameOfImage = ["cross.case",
                       "lungs",
                       "pills",
                       "cross",
                       "eyes.inverse",
                       "text.append",
                       "face.smiling",
                       "waveform.path.ecg",
                       "bolt.heart",
                       "eye.trianglebadge.exclamationmark",
                       "brain.head.profile",
                       "figure.walk",
                       "hand.thumbsup",
                       "bandage.fill",
                       ""
    ]
    
    
    
    
    // MARK: Methods
    
    func getPhrase() -> String {
        let textPhrase = Arrays.phraseArray.randomElement()!
        return textPhrase
    }
    
    func getImage() -> String {
        let textPhrase = Arrays.nameOfImage.randomElement()!
        return textPhrase
    }
}
