//
//  NewNoteView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//

import UIKit


// MARK: - NewNoteView

class NewNoteView: BaseNewView {
    
    // MARK: Properties
    
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        tableView.register(NewNoteViewCell.self, forCellReuseIdentifier: NewNoteViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

