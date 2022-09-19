//
//  AllNotesViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//

import UIKit

// MARK: - AllNotesViewCell

class AllNotesViewCell: BaseAllViewCell {
    
    //MARK: Properties
    
    let noteTitle = UILabel(
        text: "",
        font: .appleSDGothicNeoDemiBold14(),
        alignment: .left
    )
    
    let noteBody: UILabel = {
        let noteBody = UILabel(
            text: "",
            font: .appleSDGothicNeo20(),
            alignment: .left
        )
        noteBody.numberOfLines = 0
        noteBody.lineBreakMode = .byWordWrapping
        noteBody.translatesAutoresizingMaskIntoConstraints = false
        return noteBody
    }()
    
    let noteTime = UILabel(
        text: "",
        font: .appleSDGothicNeo14(),
        alignment: .left)
    
    let noteDate = UILabel(
        text: "",
        font: .appleSDGothicNeo14(),
        alignment: .left)
    
    var notesIndex: IndexPath?
    
    var verticalDividerNotesImage: UIImageView = {
        let verticalDividerRemindersImage = UIImageView()
        verticalDividerRemindersImage.image = DividerImage.notesVerticalDivider
        verticalDividerRemindersImage.translatesAutoresizingMaskIntoConstraints = false
        return verticalDividerRemindersImage
    }()
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

// MARK: - Private Methods

extension AllNotesViewCell {
    
    private func setConstraints() {
        let timeStackView = setTimeStackViewConstraints(dateLabel: noteDate, timeLabel: noteTime)
        
        let verticalDividerImageConstraintsArray = setVerticalDividerImageConstraintsArray(dividerView: verticalDividerNotesImage)
        let titleConstraintsArray = setTitleConstraintsArray(dividerView: verticalDividerNotesImage,
                                                             titleLabel: noteTitle)
        let bodyConstraintsArray = setBodyConstraintsArray(dividerView: verticalDividerNotesImage,
                                                           bodyLabel: noteBody,
                                                           titleLabel: noteTitle)
        let timeStackViewConstraintsArray = setTimeStackViewConstraintsArray(timeStackView: timeStackView,
                                                                             dividerView: verticalDividerNotesImage,
                                                                             bodyLabel: noteBody,
                                                                             mainView: self)
        
        self.addSubview(verticalDividerNotesImage)
        NSLayoutConstraint.activate(verticalDividerImageConstraintsArray)
        
        self.addSubview(noteTitle)
        NSLayoutConstraint.activate(titleConstraintsArray)
        
        self.addSubview(noteBody)
        NSLayoutConstraint.activate(bodyConstraintsArray)
        
        self.addSubview(timeStackView)
        NSLayoutConstraint.activate(timeStackViewConstraintsArray)
    }
}


// MARK: - Constants

private struct Constants {
    
    
}

