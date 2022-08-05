//
//  ContentViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

protocol SideMenuDelegate: AnyObject {
    func menuButtonTapped()
    func itemSelected(item: ContentViewControllerPresentation)
}

import UIKit

// MARK: - ContentViewController

class ContentViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: SideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(menuTapped))
    }
    
    // MARK: Methods
        
    @objc private func menuTapped() {
        delegate?.menuButtonTapped()
    }
}
