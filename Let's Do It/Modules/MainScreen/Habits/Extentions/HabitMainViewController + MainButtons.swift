//
//  HabitMainViewController + MainButtons.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class HabitsMainButtons {

    let nameAllFolderLabel = UILabel(text: "All Habits", font: .appleSDGothicNeo14(), alignment: .center)
        
        let countAllFolderLabel: UILabel = {
            var count = 15
            let label = UILabel(text: "\(count)", font: .appleSDGothicNeoDemiBold50(), alignment: .center)
            label.contentMode = .bottom
            label.textColor = .label
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let tasksFolderLabel: UILabel = {
            let label = UILabel(text: "Task Habits", font: .appleSDGothicNeo14(), alignment: .center)
            label.textColor = .red
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let countTasksFolderLabel: UILabel = {
            var count = 5
            let label = UILabel(text: "\(count)", font: .appleSDGothicNeoDemiBold50(), alignment: .center)
            label.textColor = .red
            label.contentMode = .bottom
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
        // Buttons
        
        lazy var allHabitsButton: UIButton = {
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
        lazy var tasksHabitsButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemGray5
            button.addSubview(tasksFolderLabel)
            NSLayoutConstraint.activate([tasksFolderLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: 5),
                                         tasksFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                                         tasksFolderLabel.heightAnchor.constraint(equalToConstant: 15),
                                         tasksFolderLabel.widthAnchor.constraint(equalTo: button.widthAnchor)
                                        ])
            button.addSubview(countTasksFolderLabel)
            NSLayoutConstraint.activate([countTasksFolderLabel.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -2),
                                         countTasksFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                                         countTasksFolderLabel.heightAnchor.constraint(equalToConstant: 50),
                                         countTasksFolderLabel.widthAnchor.constraint(equalToConstant: 70)
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


