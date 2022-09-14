//
//  AllRemindersViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//

import UIKit

// MARK: - AllRemindersTableViewCell
class AllRemindersTableViewCell: UITableViewCell {
    
    // MARK: Subtypes
    
    private enum DividerType: String {
        case HabitVerticalDivider
        case NotesVerticalDivider
        case RemindersVerticalDivider
    }
    
    //MARK: Properties
    
    let reminderTitle = UILabel(text: "Reminder", font: .appleSDGothicNeoDemiBold14(), alignment: .left)
    let reminderBody = UILabel(text: "Notes will be here", font: .appleSDGothicNeo14(), alignment: .left)
    let reminderTime = UILabel(text: "00:00 - 00:00", font: .appleSDGothicNeo20(), alignment: .left)
    let reminderDate = UILabel(text: "7.01.1991", font: .appleSDGothicNeoDemiBold20(), alignment: .left)
    var index: IndexPath?
    
    var verticalDividerRemindersImage: UIImageView = {
        let verticalDividerRemindersImage = UIImageView()
        verticalDividerRemindersImage.image = UIImage(named: "RemindersVerticalDivider")
        verticalDividerRemindersImage.tintColor = .white
        verticalDividerRemindersImage.translatesAutoresizingMaskIntoConstraints = false
        return verticalDividerRemindersImage
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        backgroundColor = .clear
        reminderBody.numberOfLines = 2
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    // MARK: Metods
    
    private func setConstraints() {
        let timeStackView = UIStackView(
            arrangedSubviews: [reminderBody, reminderDate, reminderTime],
            axis: .vertical,
            spacing: 2,
            distribution: .fillProportionally
        )
        
        self.addSubview(verticalDividerRemindersImage)
        NSLayoutConstraint.activate(
            [verticalDividerRemindersImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
             verticalDividerRemindersImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
             verticalDividerRemindersImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
             verticalDividerRemindersImage.widthAnchor.constraint(equalToConstant: 3.5)
            ]
        )
        
        self.addSubview(reminderTitle)
        NSLayoutConstraint.activate(
            [reminderTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
             reminderTitle.leadingAnchor.constraint(equalTo: verticalDividerRemindersImage.trailingAnchor, constant: 5),
             reminderTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
             reminderTitle.heightAnchor.constraint(equalToConstant: 20)
            ]
        )
        
        self.addSubview(timeStackView)
        NSLayoutConstraint.activate(
            [timeStackView.topAnchor.constraint(equalTo: reminderTitle.bottomAnchor, constant: 2),
             timeStackView.leadingAnchor.constraint(equalTo: verticalDividerRemindersImage.trailingAnchor, constant: 5),
             timeStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
             timeStackView.widthAnchor.constraint(equalToConstant: self.frame.size.width)
            ]
        )
    }
}
