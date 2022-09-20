//
//  RemindersMainView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class RemindersMainView: BaseMainView {
    
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       setReminderData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setReminderData() {
     
        listsArray.append("Inbox")
        listsArray.append("Repeated Reminders")
        nameLeftFolderLabel.text = "All Reminders"
        nameRightFolderLabel.text = "Missed Reminders"
        
    }
}

