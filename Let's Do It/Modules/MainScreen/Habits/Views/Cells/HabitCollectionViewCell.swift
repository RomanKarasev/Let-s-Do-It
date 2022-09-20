//
//  HabitCollectionViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit

// MARK: - HabitCollectionViewCell

class HabitCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = Constants.identifier
    
    override var isSelected: Bool {
        didSet {
            toggleSelectionMode()
        }
    }
    
    var index: IndexPath?
    var habitTitle = UILabel(text: "Food", font: .appleSDGothicNeo20(), alignment: .left)
    let habitBody = UILabel(text: "Healthy food", font: .appleSDGothicNeoDemiBold20(), alignment: .left)
    let habitDayCountLabel = UILabel(text: "Count", font: .appleSDGothicNeo20(), alignment: .left)
    let habitDayCount = UILabel(text: "1", font: .appleSDGothicNeo20(), alignment: .right)
    
    var habitImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(systemName: "bed.double")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public Methods
    
    func render(from model: ViewModel) {
        habitTitle.text = model.habitTitle
        habitBody.text = model.habitBody
        habitImageView.image = model.habitImage
    }
}

// MARK: - Private Methods

extension HabitCollectionViewCell {
    
    private func setUI() {
        backgroundColor = .systemBlue
        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.shadowOpacity = Constants.shadowOpacity
        layer.shadowRadius = Constants.shadowRadius
        layer.shadowOffset = Constants.shadowOffset
        layer.cornerRadius = Constants.cornerRadius
    }
    
    private func setConstraints() {
        self.addSubview(habitImageView)
        NSLayoutConstraint.activate(
            [habitImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             habitImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
             habitImageView.heightAnchor.constraint(equalToConstant: Constants.habitImageViewHeightAnchor),
             habitImageView.widthAnchor.constraint(equalToConstant: Constants.habitImageViewWidthAnchor)
            ]
        )
        self.addSubview(habitTitle)
        NSLayoutConstraint.activate(
            [habitTitle.topAnchor.constraint(equalTo: self.topAnchor,
                                             constant: Constants.habitTitleTopAnchor),
             habitTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                 constant: Constants.habitTitleLeadingAnchor),
             habitTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                  constant: Constants.habitTitleTrailingAnchor),
             habitTitle.heightAnchor.constraint(equalToConstant: Constants.habitTitleHeightAnchor)
            ]
        )
        self.addSubview(habitBody)
        NSLayoutConstraint.activate(
            [habitBody.topAnchor.constraint(equalTo: habitTitle.bottomAnchor),
             habitBody.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant:Constants.habitBodyLeadingAnchor),
             habitBody.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                 constant: Constants.habitBodyTrailingAnchor),
             habitBody.heightAnchor.constraint(equalToConstant: Constants.habitBodyHeightAnchor)
            ]
        )
        self.addSubview(habitDayCount)
        NSLayoutConstraint.activate(
            [habitDayCount.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                   constant: Constants.habitDayCountBottomAnchor),
             habitDayCount.leadingAnchor.constraint(equalTo: self.centerXAnchor,
                                                    constant:Constants.habitDayCountLeadingAnchor),
             habitDayCount.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                     constant: Constants.habitDayCountTrailingAnchor),
             habitDayCount.heightAnchor.constraint(equalToConstant: Constants.habitDayCountHeightAnchor)
            ]
        )
        self.addSubview(habitDayCountLabel)
        NSLayoutConstraint.activate(
            [habitDayCountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                        constant: Constants.habitDayCountLabelBottomAnchor),
             habitDayCountLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor,
                                                          constant: Constants.habitDayCountLabelTrailingAnchor),
             habitDayCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                         constant:Constants.habitDayCountLabelLeadingAnchor),
             habitDayCountLabel.heightAnchor.constraint(equalToConstant: Constants.habitDayCountLabelHeightAnchor)
            ]
        )
    }
    
    private func toggleSelectionMode() {
        layer.borderColor = isSelected ? Constants.borderColor : nil
        layer.borderWidth = isSelected ? Constants.borderWidth : .zero
    }
}

// MARK: - ViewModel

extension HabitCollectionViewCell {
    
    struct ViewModel {
        
        // MARK: Properties
        
        let habitTitle: String?
        let habitBody: String?
        let habitImage: UIImage?
        
        // MARK: Initialization
        
        init(from habit: Habit) {
            self.habitTitle = habit.title
            self.habitBody = habit.body
            self.habitImage = UIImage(systemName: habit.image ?? Constants.fallbackImageName)
        }
    }
}

// MARK: - Constants

private struct Constants {
    
    static let identifier = "HabitCollectionViewCell"
    
    static let fallbackImageName = Arrays().getImage()
    static let borderColor = UIColor.blue.cgColor
    static let borderWidth: CGFloat = 1
    
    static let shadowOpacity: Float = 0.5
    static let shadowRadius: CGFloat = 1
    static let shadowOffset: CGSize = .init(width: 2, height: 2)
    static let cornerRadius: CGFloat = 2
    
    static let habitImageViewHeightAnchor: CGFloat = 70
    static let habitImageViewWidthAnchor: CGFloat = 70
    static let habitTitleTopAnchor: CGFloat = 2
    static let habitTitleLeadingAnchor: CGFloat = 5
    static let habitTitleTrailingAnchor: CGFloat = -5
    static let habitTitleHeightAnchor: CGFloat = 15
    static let habitBodyLeadingAnchor: CGFloat = 5
    static let habitBodyTrailingAnchor: CGFloat = -5
    static let habitBodyHeightAnchor: CGFloat = 20
    static let habitDayCountBottomAnchor: CGFloat = -2
    static let habitDayCountLeadingAnchor: CGFloat = 2
    static let habitDayCountTrailingAnchor: CGFloat = -5
    static let habitDayCountHeightAnchor: CGFloat = 20
    static let habitDayCountLabelBottomAnchor: CGFloat = -2
    static let habitDayCountLabelTrailingAnchor: CGFloat = -2
    static let habitDayCountLabelLeadingAnchor: CGFloat = 5
    static let habitDayCountLabelHeightAnchor: CGFloat = 20
    
}
