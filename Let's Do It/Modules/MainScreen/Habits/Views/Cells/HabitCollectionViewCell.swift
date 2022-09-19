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
    
    static let identifier = "HabitCollectionViewCell"
    
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
        backgroundColor = #colorLiteral(red: 0.8201447112, green: 0.9895743728, blue: 0.7835234208, alpha: 1)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 1
        layer.shadowOffset = .init(width: 2, height: 2)
        layer.cornerRadius = 2
    }
    
    private func setConstraints() {
        self.addSubview(habitImageView)
        NSLayoutConstraint.activate(
            [habitImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             habitImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
             habitImageView.heightAnchor.constraint(equalToConstant: 70),
             habitImageView.widthAnchor.constraint(equalToConstant: 70)
            ]
        )
        self.addSubview(habitTitle)
        NSLayoutConstraint.activate(
            [habitTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
             habitTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
             habitTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
             habitTitle.heightAnchor.constraint(equalToConstant: 15)
            ]
        )
        self.addSubview(habitBody)
        NSLayoutConstraint.activate(
            [habitBody.topAnchor.constraint(equalTo: habitTitle.bottomAnchor),
             habitBody.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
             habitBody.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
             habitBody.heightAnchor.constraint(equalToConstant: 20)
            ]
        )
        self.addSubview(habitDayCount)
        NSLayoutConstraint.activate(
            [habitDayCount.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
             habitDayCount.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 2),
             habitDayCount.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
             habitDayCount.heightAnchor.constraint(equalToConstant: 20)
            ]
        )
        self.addSubview(habitDayCountLabel)
        NSLayoutConstraint.activate(
            [habitDayCountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
             habitDayCountLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -2),
             habitDayCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
             habitDayCountLabel.heightAnchor.constraint(equalToConstant: 20)
            ]
        )
    }
    
    private func toggleSelectionMode() {
        layer.borderColor = isSelected ? Constants.borderColor : nil
        layer.borderWidth = isSelected ? 1 : .zero
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
    
    static let fallbackImageName = Arrays().getImage()
    static let borderColor = UIColor.blue.cgColor
    static let borderWidth: CGFloat = 1
}
