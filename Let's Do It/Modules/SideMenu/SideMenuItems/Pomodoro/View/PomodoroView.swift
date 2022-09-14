//
//  PomodoroView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 07.08.2022.
//


import UIKit

// MARK: - PomodoroView

class PomodoroView: UIView {
    
    // MARK: Properties
    
    
    let downBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundDown")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    let timerLabel: UILabel = {
        let label = UILabel(text: "25:00",
                            font: .appleSDGothicNeoDemiBold50(),
                            alignment: .center
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .appleSDGothicNeo20()
        button.isHidden = true
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = .appleSDGothicNeo20()
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    lazy var floatingButton = UIButton.setupFloatingButton()
    
    lazy var focusRestSegmented: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "Focus", at: 0, animated: true)
        segment.insertSegment(withTitle: "Rest", at: 1, animated: true)
        segment.insertSegment(withTitle: "Long Rest", at: 2, animated: true)
        segment.backgroundColor = UIColor(named: "TapBarColor")
        segment.selectedSegmentTintColor = UIColor(named: "SelectedItem")
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        backgroundColor = .systemGray3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setConstraints() {
        
        self.addSubview(downBackground)
        NSLayoutConstraint.activate(
            [downBackground.topAnchor.constraint(equalTo: self.topAnchor),
             downBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             downBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             downBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ]
        )
        
        self.addSubview(focusRestSegmented)
        NSLayoutConstraint.activate(
            [focusRestSegmented.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             focusRestSegmented.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             focusRestSegmented.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             focusRestSegmented.heightAnchor.constraint(equalToConstant: 25),
             focusRestSegmented.topAnchor.constraint(equalTo: self.topAnchor, constant: 90)
            ]
        )
        
        self.addSubview(timerLabel)
        NSLayoutConstraint.activate(
            [timerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             timerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ]
        )
        
        self.addSubview(cancelButton)
        NSLayoutConstraint.activate(
            [cancelButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150),
             cancelButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             cancelButton.widthAnchor.constraint(equalToConstant: 200),
             cancelButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
        
        self.addSubview(startButton)
        NSLayoutConstraint.activate(
            [startButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -10),
             startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             startButton.widthAnchor.constraint(equalToConstant: 200),
             startButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
        
//        self.addSubview(floatingButton)
//        NSLayoutConstraint.activate([floatingButton.widthAnchor.constraint(equalToConstant: 60),
//                                     floatingButton.heightAnchor.constraint(equalToConstant: 60),
//                                     floatingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
//                                     floatingButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
//                                    ])
    }
}

