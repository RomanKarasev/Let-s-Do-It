//
//  AlertFactory.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

final class AlertFactory {

    func makeAlert(with error: Error) -> UIAlertController {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Okay", style: .default)

        alert.addAction(action)

        return alert
    }
}
