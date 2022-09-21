//
//  BaseAllViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 21.09.2022.
//

import UIKit

// MARK: - BaseAllViewController


class BaseAllViewController: UIViewController {
    
   
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "All Notes"
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: .add,
            style: .plain,
            target: self,
            action: #selector(openNewController)
        )
    }
    
    // MARK: Methods
    
    @objc func openNewController() {
    }
    
    func configureCell(cell: UITableViewCell, indexPath: IndexPath, array: [AnyObject], index: IndexPath, title: UILabel, body: UILabel, date: UILabel, time: UILabel) {
        
        _ = indexPath
        let indexOfArray = array[indexPath.row]
        title.text = indexOfArray.title
        body.text = indexOfArray.body
        date.text = indexOfArray.date
        time.text = indexOfArray.time
    }
}



