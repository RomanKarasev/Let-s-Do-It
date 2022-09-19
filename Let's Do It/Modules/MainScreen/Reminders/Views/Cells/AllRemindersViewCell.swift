//
//  AllRemindersViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//



import UIKit

// MARK: - AllRemindersTableViewCell
class AllRemindersTableViewCell: BaseAllViewCell {
    
    static let identifier = "AllRemindersTableViewCell"
    
    //MARK: Properties
    
    let reminderTitle = UILabel(text: "", font: .appleSDGothicNeoDemiBold14(), alignment: .left)
    let reminderBody = UILabel(text: "", font: .appleSDGothicNeo14(), alignment: .left)
    let reminderTime = UILabel(text: "", font: .appleSDGothicNeo20(), alignment: .left)
    let reminderDate = UILabel(text: "", font: .appleSDGothicNeoDemiBold20(), alignment: .left)
    var reminderIndex: IndexPath?
    
    var verticalDividerRemindersImage: UIImageView = {
        let verticalDividerRemindersImage = UIImageView()
        verticalDividerRemindersImage.image = DividerImage.remindersVerticalDivider
        verticalDividerRemindersImage.translatesAutoresizingMaskIntoConstraints = false
        return verticalDividerRemindersImage
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        reminderBody.lineBreakMode = .byWordWrapping
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    
    // MARK: Metods
    
    func setConstraints() {
        let timeStackView = setTimeStackViewConstraints(dateLabel: reminderDate, timeLabel: reminderTime)
        
        let verticalDividerImageConstraintsArray = setVerticalDividerImageConstraintsArray(dividerView: verticalDividerRemindersImage)
        let titleConstraintsArray = setTitleConstraintsArray(dividerView: verticalDividerRemindersImage,
                                                             titleLabel: reminderTitle)
        let bodyConstraintsArray = setBodyConstraintsArray(dividerView: verticalDividerRemindersImage,
                                                           bodyLabel: reminderBody,
                                                           titleLabel: reminderTitle)
        let timeStackViewConstraintsArray = setTimeStackViewConstraintsArray(timeStackView: timeStackView,
                                                                             dividerView: verticalDividerRemindersImage,
                                                                             bodyLabel: reminderBody, mainView: self)
        
        self.addSubview(verticalDividerRemindersImage)
        NSLayoutConstraint.activate(verticalDividerImageConstraintsArray)
        
        self.addSubview(reminderTitle)
        NSLayoutConstraint.activate(titleConstraintsArray)
        
        self.addSubview(reminderBody)
        NSLayoutConstraint.activate(bodyConstraintsArray)
        
        self.addSubview(timeStackView)
        NSLayoutConstraint.activate(timeStackViewConstraintsArray)
    }
}
