//
//  HiArrayPhrase.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class Arrays {
    
    
    let phraseArray = ["Let's make your day productive",
                       "Become the best version of yourself",
                       "The pain of discipline or the pain of regret"
    ]
    
    let nameOfImage = ["cross.case",
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

    
    
    func getPhrase() -> String {
        let textPhrase = phraseArray.randomElement()!
        return textPhrase
    }
}
