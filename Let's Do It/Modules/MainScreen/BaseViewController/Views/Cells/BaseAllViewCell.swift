//
//  BaseAllViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 16.09.2022.
//


import UIKit

// MARK: - BaseAllViewCell

class BaseAllViewCell: UITableViewCell {
    
    //MARK: Properties
    
    static let baseData = BaseAllViewCell()
    
    var index: IndexPath?
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    // MARK: Methods
    
    func setView() {
        self.selectionStyle = .none
        backgroundColor = .clearColor
    }
    
    // MARK: setTimeStackView
    
    func setTimeStackViewConstraints(dateLabel: UILabel, timeLabel: UILabel) -> UIStackView {
        let timeStackView = UIStackView(
            arrangedSubviews: [dateLabel, timeLabel],
            axis: .vertical,
            spacing: 2,
            distribution: .fillProportionally
        )
        return timeStackView
    }
    
    // MARK: setConstraintsArrays
    
    func setVerticalDividerImageConstraintsArray(dividerView: UIImageView) -> [NSLayoutConstraint] {
        let setVerticalDividerImageConstraintsArray: [NSLayoutConstraint] = [dividerView.topAnchor.constraint(equalTo: self.topAnchor,
                                                                                                              constant: Constants.verticalDividerImageTopAnchor),
                                                                             dividerView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                                                                                  constant: Constants.verticalDividerImageLeadingAnchor),
                                                                             dividerView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                                                                                 constant: Constants.verticalDividerImageBottomAnchor),
                                                                             dividerView.widthAnchor.constraint(equalToConstant: Constants.verticalDividerImageWidthAnchor)
        ]
        return setVerticalDividerImageConstraintsArray
    }
    
    func setTitleConstraintsArray(dividerView: UIImageView, titleLabel: UILabel) -> [NSLayoutConstraint] {
        let titleConstraintsArray: [NSLayoutConstraint] = [titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                                                                           constant: Constants.titleTopAnchor),
                                                           titleLabel.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor,
                                                                                               constant: Constants.titleLeadingAnchor),
                                                           titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.titleTrailingAnchor),
                                                           titleLabel.heightAnchor.constraint(equalToConstant: Constants.titleHeightAnchor)
        ]
        return titleConstraintsArray
    }
    
    func setBodyConstraintsArray(dividerView: UIImageView, bodyLabel: UILabel, titleLabel: UILabel) -> [NSLayoutConstraint] {
        let bodyConstraintsArray: [NSLayoutConstraint] = [bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                                                         constant: Constants.bodyTopAnchor),
                                                          bodyLabel.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor,
                                                                                             constant: Constants.bodyLeadingAnchor),
                                                          bodyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                                                              constant: Constants.bodyTrailingAnchor),
                                                          bodyLabel.heightAnchor.constraint(equalToConstant: Constants.bodyHeightAnchor)
        ]
        return bodyConstraintsArray
    }
    
    func setTimeStackViewConstraintsArray(timeStackView: UIView, dividerView: UIImageView, bodyLabel: UILabel, mainView: UIView) -> [NSLayoutConstraint] {
        let timeStackViewConstraintsArray: [NSLayoutConstraint] = [timeStackView.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor,
                                                                                                      constant: Constants.timeStackViewTopAnchor),
                                                                   timeStackView.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor,
                                                                                                          constant: Constants.timeStackViewLeadingAnchor),
                                                                   timeStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                                                                         constant: Constants.timeStackViewBottomAnchor),
                                                                   timeStackView.widthAnchor.constraint(equalToConstant:  mainView.frame.size.width)
        ]
        return timeStackViewConstraintsArray
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
    
    static let bodyTopAnchor: CGFloat = 2
    static let bodyLeadingAnchor: CGFloat = 5
    static let bodyTrailingAnchor: CGFloat = -10
    static let bodyHeightAnchor: CGFloat = 20
    
    static let timeStackViewTopAnchor: CGFloat = 2
    static let timeStackViewLeadingAnchor: CGFloat = 5
    static let timeStackViewBottomAnchor: CGFloat = -2
}
