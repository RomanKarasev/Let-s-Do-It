//
//  ContentViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//


// MARK: - SideMenuDelegate

protocol SideMenuDelegate: AnyObject {
    func menuButtonTapped()
    func itemSelected(item: ContentViewControllerPresentation)
}

import UIKit

// MARK: - ContentViewController

class ContentViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: SideMenuDelegate?
    
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItems()
    }
}

// MARK: - @objs extentions

@objc extension ContentViewController {
    
    private func menuTapped() {
        delegate?.menuButtonTapped()
    }
    
}
    
// MARK: - Private Methods

extension ContentViewController {
    
    
    private func setNavigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Constants.leftBarButtonImage,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(menuTapped)
        )
    }
}

// MARK: - Constants

private struct Constants {
    
    static let leftBarButtonImage = UIImage(systemName: "line.3.horizontal")
}
