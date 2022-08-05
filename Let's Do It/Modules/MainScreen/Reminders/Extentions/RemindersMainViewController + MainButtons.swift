//
//  RemindersMainViewController + MainButtons.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class RemindersMainButtons {

    let nameAllFolderLabel = UILabel(text: "All Reminders", font: .appleSDGothicNeo14(), alignment: .center)
        
        let countAllFolderLabel: UILabel = {
            var count = 155
            let label = UILabel(text: "\(count)", font: .appleSDGothicNeoDemiBold50(), alignment: .center)
            label.contentMode = .bottom
            label.textColor = .label
            return label
        }()
        
        let nameMisFolderLabel: UILabel = {
            let label = UILabel(text: "Missed Reminders", font: .appleSDGothicNeo14(), alignment: .center)
            label.textColor = .red
            return label
        }()
        
        let countMissFolderLabel: UILabel = {
            var count = 5
            let label = UILabel(text: "\(count)", font: .appleSDGothicNeoDemiBold50(), alignment: .center)
            label.textColor = .red
            label.contentMode = .bottom
            return label
        }()
        
        
        // Buttons
        
        lazy var allRemindersButton: UIButton = {
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
        lazy var missedRemindersButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemGray5
            button.addSubview(nameMisFolderLabel)
            NSLayoutConstraint.activate([nameMisFolderLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: 5),
                                         nameMisFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                                         nameMisFolderLabel.heightAnchor.constraint(equalToConstant: 15),
                                         nameMisFolderLabel.widthAnchor.constraint(equalTo: button.widthAnchor)
                                        ])
            button.addSubview(countMissFolderLabel)
            NSLayoutConstraint.activate([countMissFolderLabel.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -2),
                                         countMissFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                                         countMissFolderLabel.heightAnchor.constraint(equalToConstant: 50),
                                         countMissFolderLabel.widthAnchor.constraint(equalToConstant: 70)
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

