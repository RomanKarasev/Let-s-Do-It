//
//  AllNotesViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//

import UIKit

// MARK: - AllNotesViewCell

class AllNotesViewCell: UITableViewCell {
    
    //MARK: Properties
    
    let noteTitle = UILabel(
        text: "Note",
        font: .appleSDGothicNeoDemiBold14(),
        alignment: .left
    )
    
    let noteBody: UILabel = {
        let noteBody = UILabel(text: "Notes will be here",
                               font: .appleSDGothicNeo20(),
                               alignment: .left
        )
        noteBody.numberOfLines = 0
        noteBody.lineBreakMode = .byWordWrapping
        noteBody.translatesAutoresizingMaskIntoConstraints = false
        return noteBody
    }()
    let noteTime = UILabel(text: "00:00 - 00:00",
                           font: .appleSDGothicNeo14(),
                           alignment: .left)
    let noteDate = UILabel(text: "7.01.1991",
                           font: .appleSDGothicNeo14(),
                           alignment: .left)
    var index: IndexPath?
    
    var verticalDividerNotesImage: UIImageView = {
        let verticalDividerRemindersImage = UIImageView()
        verticalDividerRemindersImage.image = UIImage(named: "NotesVerticalDivider")
        verticalDividerRemindersImage.tintColor = .white
        verticalDividerRemindersImage.translatesAutoresizingMaskIntoConstraints = false
        return verticalDividerRemindersImage
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        backgroundColor = .clear
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    // MARK: Metods
    
    private func setConstraints() {
        let timeStackView = UIStackView(arrangedSubviews: [noteDate, noteTime],
                                        axis: .vertical,
                                        spacing: 2,
                                        distribution: .fillProportionally
        )
        
        self.addSubview(verticalDividerNotesImage)
        NSLayoutConstraint.activate(
            [verticalDividerNotesImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
             verticalDividerNotesImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
             verticalDividerNotesImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
             verticalDividerNotesImage.widthAnchor.constraint(equalToConstant: 3.5)
            ]
        )
        
        self.addSubview(noteTitle)
        NSLayoutConstraint.activate(
            [noteTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
             noteTitle.leadingAnchor.constraint(equalTo: verticalDividerNotesImage.trailingAnchor, constant: 5),
             noteTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
             noteTitle.heightAnchor.constraint(equalToConstant: 20)
            ]
        )
        
        self.addSubview(timeStackView)
        NSLayoutConstraint.activate(
            [timeStackView.leadingAnchor.constraint(equalTo: verticalDividerNotesImage.trailingAnchor, constant: 5),
             timeStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
             timeStackView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
             timeStackView.heightAnchor.constraint(equalToConstant: 30)
            ]
        )
        
        self.addSubview(noteBody)
        NSLayoutConstraint.activate(
            [noteBody.topAnchor.constraint(equalTo: noteTitle.bottomAnchor, constant: 2),
             noteBody.leadingAnchor.constraint(equalTo: verticalDividerNotesImage.trailingAnchor, constant: 5),
             noteBody.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
             noteBody.bottomAnchor.constraint(equalTo: timeStackView.topAnchor, constant: -2)
            ]
        )
    }
}
