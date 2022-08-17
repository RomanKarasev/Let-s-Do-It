//
//  AllHabitsViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit


class AllHabitsViewController: UIViewController {
    
    
    private var habitsStore: HabitsStoreInput
    private var alertFactory: AlertFactory
//
    
    let sectionTitles: [String] = ["All Habits"]
    
    let nameOfImage = ["cross.case", "lungs", "pills", "cross", "eyes.inverse", "text.append", "face.smiling", "waveform.path.ecg", "bolt.heart", "eye.trianglebadge.exclamationmark", "brain.head.profile", "figure.walk", "hand.thumbsup", "bandage.fill"]
    
    let habitCollectionViewCell = HabitCollectionViewCell()
    var habits = [Habit]()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(
        store: HabitsStoreInput,
        alertFactory: AlertFactory
    ) {
        self.habitsStore = store
        self.alertFactory = alertFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Habits"
        configureView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(openNewHabit))
    }
   
    @objc func openNewHabit() {
        let vc = NewHabitViewController(with: HabitsStore(coreDataService: CoreDataService()), alertFactory: AlertFactory())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
        setConstraints()
        configureTableView()
        
    }
    
    func configureTableView() {
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
    
    func setConstraints() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                                    ])
    }
}

extension AllHabitsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.identifier, for: indexPath) as? HabitCollectionViewCell else { return UICollectionViewCell() }
        let indexOfArray = habits[indexPath.row]
        cell.habitTitle.text = indexOfArray.title
        cell.habitBody.text = indexOfArray.body
        cell.habitImageView.image = UIImage(systemName: nameOfImage[indexPath.row])
        cell.backgroundColor = .yellow
//        cell.layer.borderWidth = 0.5
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 1
        cell.layer.shadowOffset = .init(width: 2, height: 2)
        cell.layer.cornerRadius = 2
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let margin: CGFloat = 20
        let size: CGFloat = (collectionView.frame.size.width-margin) / 3

        return CGSize(width: size, height: size*1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            
        return UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
    }
    
}

