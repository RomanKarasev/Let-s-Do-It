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
    
    static var identifier = Constants.identifier
    
    private var itemIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.clearColor
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Methods
    
    func configureCell(icon: UIImage?, text: String) {
        itemIcon.image = icon
        itemLabel.text = text
    }
}

// MARK: - Private Methods

extension SideMenuItemCell {
    
    private func configureConstraints() {
        
        contentView.addSubview(itemIcon)
        NSLayoutConstraint.activate(
            [itemIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
             itemIcon.widthAnchor.constraint(equalToConstant: Constants.widthForItemIcon),
             itemIcon.heightAnchor.constraint(equalToConstant: Constants.heightAnchor),
             itemIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: Constants.leadingAnchor
                                              )
            ]
        )
        
        contentView.addSubview(itemLabel)
        NSLayoutConstraint.activate(
            [itemLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
             itemLabel.heightAnchor.constraint(equalToConstant: Constants.heightAnchor),
             itemLabel.leadingAnchor.constraint(equalTo: itemIcon.trailingAnchor,
                                                constant: Constants.leadingAnchor
                                               ),
             itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ]
        )
    }
}

// MARK: - Constants

private struct Constants {
    
    static let leadingAnchor: CGFloat = 20
    static let heightAnchor: CGFloat = 40
    static let identifier = "SideMenuItemCell"
    static let widthForItemIcon: CGFloat = 40
}
