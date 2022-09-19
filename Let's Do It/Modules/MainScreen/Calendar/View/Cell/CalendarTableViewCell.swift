//
//  CalendarTableViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 17.08.2022.
//


import UIKit

// MARK: - CalendarTableViewCell

class CalendarTableViewCell: BaseAllViewCell {
        
    //MARK: Properties
    
    static var identifier = Constants.identifier
    
    let calendarTitle = UILabel(text: "Event", font: .appleSDGothicNeoDemiBold14(), alignment: .left)
    let calendarBody = UILabel(text: "Notes will be here", font: .appleSDGothicNeo14(), alignment: .left)
    let calendarTime = UILabel(text: "00:00 - 00:00", font: .appleSDGothicNeo20(), alignment: .left)
    let calendarDate = UILabel(text: "7.01.1991", font: .appleSDGothicNeoDemiBold20(), alignment: .left)
    var calendarIndex: IndexPath?

    
    var calendarVerticalDividerImage: UIImageView = {
        let verticalDividerImage = UIImageView()
        verticalDividerImage.image = DividerImage.habitVerticalDivider
        verticalDividerImage.translatesAutoresizingMaskIntoConstraints = false
        return verticalDividerImage
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        calendarBody.numberOfLines = 2
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}
// MARK: - Private Methods

extension CalendarTableViewCell {
    
    private func setConstraints() {
        
        let timeStackView = setTimeStackViewConstraints(dateLabel: calendarDate, timeLabel: calendarTime)
        
        let verticalDividerImageConstraintsArray = setVerticalDividerImageConstraintsArray(dividerView: calendarVerticalDividerImage)
        let titleConstraintsArray = setTitleConstraintsArray(dividerView: calendarVerticalDividerImage,
                                                             titleLabel: calendarTitle)
        let bodyConstraintsArray = setBodyConstraintsArray(dividerView: calendarVerticalDividerImage,
                                                           bodyLabel: calendarBody,
                                                           titleLabel: calendarTitle)
        let timeStackViewConstraintsArray = setTimeStackViewConstraintsArray(timeStackView: timeStackView,
                                                                             dividerView: calendarVerticalDividerImage,
                                                                             bodyLabel: calendarBody, mainView: self)
        
        self.addSubview(calendarVerticalDividerImage)
        NSLayoutConstraint.activate(verticalDividerImageConstraintsArray)
        
        self.addSubview(calendarTitle)
        NSLayoutConstraint.activate(titleConstraintsArray)
        
        self.addSubview(calendarBody)
        NSLayoutConstraint.activate(bodyConstraintsArray)
        
        self.addSubview(timeStackView)
        NSLayoutConstraint.activate(timeStackViewConstraintsArray)
    }
}

// MARK: - Constants

private struct Constants {
    
    static let identifier = "CalendarTableViewCell"
    
    static let verticalDividerImageTopAnchor: CGFloat = 5
    static let verticalDividerImageLeadingAnchor: CGFloat = 10
    static let verticalDividerImageBottomAnchor: CGFloat = -5
    static let verticalDividerImageWidthAnchor: CGFloat = 3.5
    
    static let titleTopAnchor: CGFloat = 10
    static let titleLeadingAnchor: CGFloat = 5
    static let titleTrailingAnchor: CGFloat = -10
    static let titleHeightAnchor: CGFloat = 20
    
    static let timeStackViewTopAnchor: CGFloat = 2
    static let timeStackViewLeadingAnchor: CGFloat = 5
    static let timeStackViewBottomAnchor: CGFloat = -2
}

