//
//  ContentViewControllerPresentation.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

enum ContentViewControllerPresentation {
    case embed(ContentViewController)
    case push(UIViewController)
    case modal(UIViewController)
}
