//
//  SideMenuItemCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

// MARK: - SideMenuItemCell

final class SideMenuItemCell: UITableViewCell {
    
    // MARK: Properties
    
    static var identifier = "SideMenuItemCell"
    
    // Views
    
    private var itemIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Labels
    
    private var itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Methods
  
    private func configureConstraints() {
        
        contentView.addSubview(itemIcon)
        NSLayoutConstraint.activate([itemIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     itemIcon.widthAnchor.constraint(equalToConstant: 35),
                                     itemIcon.heightAnchor.constraint(equalToConstant: 30),
                                     itemIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
                                    ])
        
        contentView.addSubview(itemLabel)
        NSLayoutConstraint.activate([itemLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     itemLabel.heightAnchor.constraint(equalToConstant: 40),
                                     itemLabel.leadingAnchor.constraint(equalTo: itemIcon.trailingAnchor, constant: 20),
                                     itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
                                    ])
    }
    
    func configureCell(icon: UIImage?, text: String) {
        itemIcon.image = icon
        itemLabel.text = text
    }
}
