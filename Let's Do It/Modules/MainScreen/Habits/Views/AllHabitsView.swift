//
//  AllHabitsView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 20.09.2022.
//

import UIKit

//MARK: - AllHabitsView

class AllHabitsView: UIView {
    
    // MARK: Properties
    
    let sectionTitles: [String] = ["All Habits"]
    
    let nameOfImage = Arrays.nameOfImage
    
    let habitCollectionViewCell = HabitCollectionViewCell()
    var habits = [Habit]()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appBackgroundColor
        setConstraints()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        self.addSubview(collectionView)
        NSLayoutConstraint.activate(
            [collectionView.topAnchor.constraint(equalTo: self.topAnchor),
             collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ]
        )
    }
}


// MARK: - Constants

private struct Constants {

    static let selectTitle = "Select"
}

