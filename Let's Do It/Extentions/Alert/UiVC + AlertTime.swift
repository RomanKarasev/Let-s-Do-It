//
//  UiVC + AlertTime.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

// MARK: - UIViewController
extension UIViewController {
    
    func alertTime(label: UILabel, completionHandler: @escaping(NSDate) -> Void) {
        
        // MARK: Alert && TimePicker
        
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.locale = NSLocale(localeIdentifier: "Ru_ru") as Locale
        
        if #available(iOS 13.4, *) {
            timePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        alert.view.addSubview(timePicker)
        
        // MARK: OK
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let timeString = dateFormatter.string(from: timePicker.date)
            
            let time = timePicker.date as NSDate
            completionHandler(time)
            
            label.text = timeString
        }
        
        // MARK: Cancel
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        
        // MARK: addAction
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        timePicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        timePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
        
        present(alert, animated: true, completion: nil)
    }
}
