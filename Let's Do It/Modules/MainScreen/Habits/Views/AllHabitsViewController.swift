//
//  AllHabitsViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit

//MARK: - AllHabitsViewController

class AllHabitsViewController: UIViewController {
    
    // MARK: Properties
    
    private var habitsStore: HabitsStoreInput
    private var alertFactory: AlertFactory
    private var selectionToggled: Bool = false
    let allHabitsView = AllHabitsView()
    let habitCollectionViewCell = HabitCollectionViewCell()
    var habits = [Habit]()
    

    // MARK: Initialization
    
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
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        title = "All Habits"
        configureView()
        setNavigationController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        allHabitsView.collectionView.reloadData()
    }
    
    override func loadView() {
        super.loadView()
        view = allHabitsView
    }
   
    // MARK: Methods
    
    @objc func openNewHabit() {
        let vc = NewHabitViewController(with: HabitsStore(coreDataService: CoreDataService()), alertFactory: AlertFactory())
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func toggleSelectionMode() {
        selectionToggled.toggle()
        print(selectionToggled)
    }
}


// MARK: - Private Methods

extension AllHabitsViewController {
    
    private func setNavigationController() {
        navigationController?.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(openNewHabit))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: Constants.selectTitle,
            style: .plain,
            target: self,
            action: #selector(toggleSelectionMode)
        )
    }
    
    private func configureView() {
        view.backgroundColor = .appBackgroundColor
        configureTableView()
    }
    
    private func configureTableView() {
        allHabitsView.collectionView.delegate = self
        allHabitsView.collectionView.dataSource = self
        
        fetchHabits { habits in
            if let habits = habits {
                self.habits = habits
            }
            self.allHabitsView.collectionView.reloadData()
        }
    }
    
    private func fetchHabits(_ completion: @escaping ([Habit]?) -> Void) {
        habitsStore.getHabits { habits, error in
            if let habits = habits {
                completion(habits)
            }
        }
    }

    private func reloadData(from habits: [Habit]?) {
        guard let habits = habits
        else {
            return
        }

        self.habits = habits
        allHabitsView.collectionView.reloadData()
    }
    
    private func openHabitDetails(with habit: Habit) {
        let vc = NewHabitViewController(
            with: HabitsStore(coreDataService: CoreDataService()),
            alertFactory: AlertFactory()
        )
        vc.currentHabit = habit
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension AllHabitsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HabitCollectionViewCell.identifier,
            for: indexPath
        ) as? HabitCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        cell.render(
            from: HabitCollectionViewCell.ViewModel(
                from: habits[indexPath.row]
            )
        )

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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HabitCollectionViewCell.identifier, for: indexPath
        ) as? HabitCollectionViewCell
        else {
            return
        }

        let currentHabit = habits[indexPath.row]

        if selectionToggled {
            
        } else {
            openHabitDetails(with: currentHabit)
        }
    }
}

// MARK: - <UINavigationDelegate> Comformance

extension AllHabitsViewController: UINavigationControllerDelegate {

    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        guard let viewController = viewController as? AllHabitsViewController
        else {
            return
        }

        viewController.fetchHabits { habits in
            self.reloadData(from: habits)
        }
    }
}

// MARK: - Constants

private struct Constants {

    static let selectTitle = "Select"
}
