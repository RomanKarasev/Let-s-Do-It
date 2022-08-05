//
//  NotesMainViewController + MainButtons.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class NotesMainButtons {

    let nameAllFolderLabel = UILabel(text: "All Notes", font: .appleSDGothicNeo14(), alignment: .center)
        
        let countAllFolderLabel: UILabel = {
            var count = 55
            let label = UILabel(text: "\(count)", font: .appleSDGothicNeoDemiBold50(), alignment: .center)
            label.contentMode = .bottom
            label.textColor = .label
            return label
        }()
        
        let repeatedNotesFolderLabel: UILabel = {
            let label = UILabel(text: "Repeated Notes", font: .appleSDGothicNeo14(), alignment: .center)
            label.textColor = .red
            return label
        }()
        
        let countRepeatedNotesFolderLabel: UILabel = {
            var count = 5
            let label = UILabel(text: "\(count)", font: .appleSDGothicNeoDemiBold50(), alignment: .center)
            label.textColor = .red
            label.contentMode = .bottom
            return label
        }()
        
        
        // Buttons
        
        lazy var allNotesButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemGray5
            button.addSubview(nameAllFolderLabel)
            NSLayoutConstraint.activate([nameAllFolderLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: 5),
                                         nameAllFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                                         nameAllFolderLabel.heightAnchor.constraint(equalToConstant: 15),
                                         nameAllFolderLabel.widthAnchor.constraint(equalTo: button.widthAnchor)
                                        ])
            button.addSubview(countAllFolderLabel)
            NSLayoutConstraint.activate([countAllFolderLabel.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -2),
                                         countAllFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                                         countAllFolderLabel.heightAnchor.constraint(equalToConstant: 50),
                                         countAllFolderLabel.widthAnchor.constraint(equalToConstant: 70)
                                        ])
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 15
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.4
            button.layer.shadowRadius = 5
            button.layer.shadowOffset = .init(width: 2, height: 2)
            return button
        }()
    //
        lazy var repeatedNotesButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemGray5
            button.addSubview(repeatedNotesFolderLabel)
            NSLayoutConstraint.activate([repeatedNotesFolderLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: 5),
                                         repeatedNotesFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                                         repeatedNotesFolderLabel.heightAnchor.constraint(equalToConstant: 15),
                                         repeatedNotesFolderLabel.widthAnchor.constraint(equalTo: button.widthAnchor)
                                        ])
            button.addSubview(countRepeatedNotesFolderLabel)
            NSLayoutConstraint.activate([countRepeatedNotesFolderLabel.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -2),
                                         countRepeatedNotesFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                                         countRepeatedNotesFolderLabel.heightAnchor.constraint(equalToConstant: 50),
                                         countRepeatedNotesFolderLabel.widthAnchor.constraint(equalToConstant: 70)
                                        ])
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 15
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.4
            button.layer.shadowRadius = 5
            button.layer.shadowOffset = .init(width: 2, height: 2)
            return button
        }()
}


