//
//  HabitCollectionViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit


class HabitCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "HabitCollectionViewCell"
    
    
    
    var index: IndexPath?
    var habitTitle = UILabel(text: "Food", font: .appleSDGothicNeo20(), alignment: .left)
    let habitBody = UILabel(text: "Healthy food", font: .appleSDGothicNeoDemiBold20(), alignment: .left)
    let habitDayCountLabel = UILabel(text: "Count", font: .appleSDGothicNeo20(), alignment: .left)
    let habitDayCount = UILabel(text: "1", font: .appleSDGothicNeo20(), alignment: .right)
    let habitImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(systemName: "bed.double")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
   
    
    func setConstraints() {
        self.addSubview(habitImageView)
        NSLayoutConstraint.activate([habitImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     habitImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     habitImageView.heightAnchor.constraint(equalToConstant: 70),
                                     habitImageView.widthAnchor.constraint(equalToConstant: 70)
                                    ])
        self.addSubview(habitTitle)
        NSLayoutConstraint.activate([habitTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
                                     habitTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                                     habitTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                                     habitTitle.heightAnchor.constraint(equalToConstant: 15)
                                    ])
        self.addSubview(habitBody)
        NSLayoutConstraint.activate([habitBody.topAnchor.constraint(equalTo: habitTitle.bottomAnchor),
                                     habitBody.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                                     habitBody.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                                     habitBody.heightAnchor.constraint(equalToConstant: 20)
                                    ])
        self.addSubview(habitDayCount)
        NSLayoutConstraint.activate([habitDayCount.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
                                     habitDayCount.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 2),
                                     habitDayCount.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                                     habitDayCount.heightAnchor.constraint(equalToConstant: 20)
                                    ])
        self.addSubview(habitDayCountLabel)
        NSLayoutConstraint.activate([habitDayCountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
                                     habitDayCountLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -2),
                                     habitDayCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                                     habitDayCountLabel.heightAnchor.constraint(equalToConstant: 20)
                                    ])
    }
}
