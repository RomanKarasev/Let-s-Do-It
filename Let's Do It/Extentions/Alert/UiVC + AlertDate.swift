//
//  UiVC + AlertDate.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

// MARK: - UIViewController

extension UIViewController {
    
    func alertDate(label: UILabel, completionHandler: @escaping(Int, NSDate) -> Void) {
        
        // MARK: Alert && DatePicker
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
            } else {
                // Fallback on earlier versions
            }
        alert.view.addSubview(datePicker)
        
        // MARK: Ok
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateString = dateFormatter.string(from: datePicker.date)
            
            let calendar = Calendar.current
            let component = calendar.dateComponents([.weekday], from: datePicker.date)
            guard let weekday = component.weekday else { return }
            let numberWeekDay = weekday
            
            let date = datePicker.date as NSDate
            completionHandler(numberWeekDay, date)
            
            label.text = dateString
        }
        
        // MARK: Cancel
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        
        // MARK: addAction
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 370).isActive = true
        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
        
        present(alert, animated: true, completion: nil)
    }
}
