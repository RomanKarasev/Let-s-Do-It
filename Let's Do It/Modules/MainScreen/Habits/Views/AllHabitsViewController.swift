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
    
    
    let sectionTitles: [String] = ["All Habits"]
    
    var habits = [Habit]()
    private lazy var mainTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped )
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
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
        view.backgroundColor = .systemGray4
        setConstraints()
        configureTableView()
    }
    
    func configureTableView() {
        mainTable.delegate = self
        mainTable.dataSource = self
        
//        fetchHabits { habits in
//            if let habits = habits {
//                self.habits = habits
//            }
//
//            self.mainTable.reloadData()
//        }
    }
    
//    private func fetchHabits(_ completion: @escaping ([Habit]?) -> Void) {
//        habitsStore.getHabits { habits, error in
//            if let habits = habits {
//                completion(habits)
//            }
//        }
//    }
    
    func setConstraints() {
        view.addSubview(mainTable)
        NSLayoutConstraint.activate([mainTable.topAnchor.constraint(equalTo: view.topAnchor),
                                     mainTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     mainTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     mainTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                                    ])
    }
    
//    func configureCell(cell: CollectionViewTableViewCell, indexPath: IndexPath) {
//
////        cell.index = indexPath
////        let indexOfArray = notes[indexPath.row]
////        cell.noteTitle.text = indexOfArray.title
////        cell.noteBody.text = indexOfArray.body
////        cell.noteDate.text = indexOfArray.date
////        cell.noteTime.text = indexOfArray.time
//    }
}

extension AllHabitsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .label
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
}
