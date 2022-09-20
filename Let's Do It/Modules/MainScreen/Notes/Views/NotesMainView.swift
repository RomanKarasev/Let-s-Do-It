//
//  NotesMainView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class NotesMainView: BaseMainView {
    
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setNotesData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setNotesData() {
        
        listsArray.append("Inbox")
        listsArray.append("Quick Notes")
        nameLeftFolderLabel.text = "All Notes"
        nameRightFolderLabel.text = "Repeated Notes"
        
    }
}


