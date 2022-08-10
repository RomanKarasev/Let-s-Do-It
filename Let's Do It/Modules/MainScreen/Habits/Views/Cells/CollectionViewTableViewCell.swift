//
//  CollectionViewTableViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    private var habitsStore: HabitsStoreInput
    private var alertFactory: AlertFactory
    
    static let identifier = "CollectionViewTableViewCell"
    
    
    var habits = [Habit]()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 150)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, store: HabitsStoreInput, alertFactory: AlertFactory) {
        self.habitsStore = store
        self.alertFactory = alertFactory
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        configureView()
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
                                    ])
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fetchHabits { habits in
            if let habits = habits {
                self.habits = habits
            }

            self.collectionView.reloadData()
        }
    }
    
    private func fetchHabits(_ completion: @escaping ([Habit]?) -> Void) {
        habitsStore.getHabits { habits, error in
            if let habits = habits {
                completion(habits)
            }
        }
    }
    
    func configureCell(cell: HabitCollectionViewCell, indexPath: IndexPath) {

        cell.index = indexPath
        let indexOfArray = habits[indexPath.row]
        cell.habitTitle.text = indexOfArray.title
        cell.habitBody.text = indexOfArray.body
        cell.habitImageView.image = UIImage(named: "\(indexOfArray.image)")
        cell.habitDayCount.text = indexOfArray.dayCount
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.identifier, for: indexPath) as! HabitCollectionViewCell
//        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
}
