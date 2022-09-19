//
//  ContainerViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

//MARK: - ContainerViewController

class ContainerViewController: UIViewController {
    
    // MARK: Properties
    
    private var sideMenuViewController: SideMenuViewController!
    private var nav: UINavigationController!
    private var rootViewController: ContentViewController! {
        didSet { rootViewController.delegate = self
            nav.setViewControllers([rootViewController], animated: false)
        }
    }
    
    // MARK: Init
    
    convenience init(sideMenuViewController: SideMenuViewController, rootViewController: ContentViewController) {
        self.init()
        self.sideMenuViewController = sideMenuViewController
        self.rootViewController = rootViewController
        self.nav = UINavigationController(rootViewController: rootViewController)
    }
    
    // MARK: View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: - @objs extentions

@objc extension ContainerViewController {
    
    private func swipedLeft() {
        sideMenuViewController.hide()
    }
    

    private func swipedRight() {
        sideMenuViewController.show()
    }
}

// MARK: - Private Methods

extension ContainerViewController {
    
    
    
    private func configureView() {
        addChildViewControllers()
        configureDelegates()
        configureGestures()
    }
    
    private func configureDelegates() {
        sideMenuViewController.delegate = self
        rootViewController.delegate = self
    }
    
    private func configureGestures() {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeftGesture.direction = .left
        swipeLeftGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeLeftGesture)
        
        let rightSwipeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(swipedRight))
        rightSwipeGesture.cancelsTouchesInView = false
        rightSwipeGesture.edges = .left
        view.addGestureRecognizer(rightSwipeGesture)
    }
    
    private func addChildViewControllers() {
        addChild(nav)
        view.addSubview(nav.view)
        nav.didMove(toParent: self)
        
        addChild(sideMenuViewController)
        view.addSubview(sideMenuViewController.view)
        sideMenuViewController.didMove(toParent: self)
    }
    
    private func updateRootViewController(_ viewController: ContentViewController) {
        rootViewController = viewController
    }
}

// MARK: - SideMenuDelegate

extension ContainerViewController: SideMenuDelegate {
    
    func menuButtonTapped() {
        sideMenuViewController.show()
    }
    
    func itemSelected(item: ContentViewControllerPresentation) {
        switch item {
        case let .embed(viewController):
            updateRootViewController(viewController)
            sideMenuViewController.hide()
        case let .push(viewController):
            sideMenuViewController.hide()
            nav.pushViewController(viewController, animated: true)
        case let .modal(viewController):
            sideMenuViewController.hide()
            nav.present(viewController, animated: true, completion: nil)
        }
    }
}



