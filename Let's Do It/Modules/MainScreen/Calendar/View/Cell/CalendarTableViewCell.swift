//
//  CalendarTableViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 17.08.2022.
//


import UIKit

// MARK: - CalendarTableViewCell

class CalendarTableViewCell: UITableViewCell {
    
    // MARK: Subtypes
    
    private enum DividerType: String {
        case HabitVerticalDivider
        case NotesVerticalDivider
        case RemindersVerticalDivider
    }
    
    //MARK: Properties
    
    static var identifier = "CalendarTableViewCell"
    
    let title = UILabel(text: "Event", font: .appleSDGothicNeoDemiBold14(), alignment: .left)
    let body = UILabel(text: "Notes will be here", font: .appleSDGothicNeo14(), alignment: .left)
    let time = UILabel(text: "00:00 - 00:00", font: .appleSDGothicNeo20(), alignment: .left)
    let date = UILabel(text: "7.01.1991", font: .appleSDGothicNeoDemiBold20(), alignment: .left)
    var index: IndexPath?
    
    
    // Views
    
    var verticalDividerImage: UIImageView = {
        let verticalDividerImage = UIImageView()
        verticalDividerImage.image = UIImage(named: DividerType.HabitVerticalDivider.rawValue)
        verticalDividerImage.tintColor = .white
        verticalDividerImage.translatesAutoresizingMaskIntoConstraints = false
        return verticalDividerImage
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        backgroundColor = .clear
        body.numberOfLines = 2
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    // MARK: Metods
    
    private func setConstraints() {
        let timeStackView = UIStackView(
            arrangedSubviews: [body, date, time],
            axis: .vertical,
            spacing: 2,
            distribution: .fillProportionally
        )
        
        self.addSubview(verticalDividerImage)
        NSLayoutConstraint.activate(
            [verticalDividerImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
             verticalDividerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
             verticalDividerImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
             verticalDividerImage.widthAnchor.constraint(equalToConstant: 3.5)
            ]
        )
        
        self.addSubview(title)
        NSLayoutConstraint.activate(
            [title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
             title.leadingAnchor.constraint(equalTo: verticalDividerImage.trailingAnchor, constant: 5),
             title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
             title.heightAnchor.constraint(equalToConstant: 20)
            ]
        )
        
        self.addSubview(timeStackView)
        NSLayoutConstraint.activate(
            [timeStackView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
             timeStackView.leadingAnchor.constraint(equalTo: verticalDividerImage.trailingAnchor, constant: 5),
             timeStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
             timeStackView.widthAnchor.constraint(equalToConstant: self.frame.size.width)
            ]
        )
    }
}
