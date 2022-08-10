//
//  NewNoteViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit

// MARK: - NewNoteViewCell

class NewNoteViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: Properties
    static let identifier = "NewNoteViewCell"
    
    var note: Note?
    
    let cellNameArray = [["", ""],
                         ["Date", "Time"],
                         ["Set Color"]]
    
    let cellTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "???"
        tf.textColor = .label
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    // Views
    
    let backgroundViewCell: UIView = {
       let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
   // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        setConstraints()
        cellTextField.isHidden = true
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    // MARK: Methods
    
    func configureCell(cell: UITableViewCell, indexPath: IndexPath) {
        cell.textLabel?.text = cellNameArray[indexPath.section][indexPath.row]
        cell.textLabel?.textColor = .label
        switch indexPath {
        case [0,0]:
            cellTextField.isHidden = false
            cellTextField.placeholder = "Title"
            
        case [0,1]:
            cellTextField.isHidden = false
            cellTextField.placeholder = "Body"
        default:
            break
        }
        
        cellTextField.delegate = self
        
        if indexPath == [2,0] {
            backgroundViewCell.backgroundColor = .secondarySystemFill
        }

        guard let note = note
        else { return }

        switch indexPath {
        case [0,0]:
            cellTextField.text = note.title
        case [0,1]:
            cellTextField.text = note.body
        case [1,0]:
            textLabel?.text = note.date
        case [1,1]:
            textLabel?.text = note.time
        case [2,0]:
            break
//            backgroundViewCell.backgroundColor = UIColor(named: note.color ?? "")
        default:
            break
        }
    }
    
    // MARK: setConstraints
    
    func setConstraints() {

        contentView.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate([backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                                     backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                                     backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                                     backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
                                    ])
        
        backgroundViewCell.addSubview(cellTextField)
        NSLayoutConstraint.activate([cellTextField.topAnchor.constraint(equalTo: backgroundViewCell.topAnchor),
                                     cellTextField.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor, constant: 10),
                                     cellTextField.trailingAnchor.constraint(equalTo: backgroundViewCell.trailingAnchor),
                                     cellTextField.bottomAnchor.constraint(equalTo: backgroundViewCell.bottomAnchor)
                                    ])
    }
}



