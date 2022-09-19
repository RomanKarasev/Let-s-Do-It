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
        imageView.image = Constants.backgroundImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel(text: Constants.timerLabelText,
                            font: .appleSDGothicNeoDemiBold50(),
                            alignment: .center
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.titleForButtonsWithBackground, for: .normal)
        button.titleLabel?.font = .appleSDGothicNeo20()
        button.isHidden = true
        button.backgroundColor = Constants.cancelButtonBackgroundColor
        button.layer.cornerRadius = Constants.buttonsCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = .appleSDGothicNeo20()
        button.setTitleColor(UIColor.titleForButtonsWithBackground, for: .normal)
        button.backgroundColor = Constants.startButtonBackgroundColor
        button.layer.cornerRadius = Constants.buttonsCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var floatingButton = UIButton.setupFloatingButton()
    
    lazy var focusRestSegmented: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: Constants.segmentedTitle0,
                              at: 0,
                              animated: true
        )
        segment.insertSegment(withTitle: Constants.segmentedTitle1,
                              at: 1,
                              animated: true
        )
        segment.insertSegment(withTitle: Constants.segmentedTitle2,
                              at: 2,
                              animated: true
        )
        segment.backgroundColor = .segmentedBackgroundColor
        segment.selectedSegmentTintColor = .accentColor
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        backgroundColor = .appBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

extension PomodoroView {
    
    // MARK: setConstraints
    
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
             focusRestSegmented.heightAnchor.constraint(equalToConstant: Constants.focusRestSegmentedHeightAncor),
             focusRestSegmented.topAnchor.constraint(equalTo: self.topAnchor,
                                                     constant: Constants.focusRestSegmentedTopAncor)
            ]
        )
        
        self.addSubview(timerLabel)
        NSLayoutConstraint.activate(
            [timerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             timerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ]
        )
        
        self.addSubview(startButton)
        NSLayoutConstraint.activate(
            [startButton.topAnchor.constraint(equalTo: self.centerYAnchor,
                                              constant: Constants.startButtonTopAnchor),
             startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             startButton.widthAnchor.constraint(equalToConstant: Constants.buttonsWidthAnchor),
             startButton.heightAnchor.constraint(equalToConstant: Constants.buttonsHeightAnchor)
            ]
        )
        
        self.addSubview(cancelButton)
        NSLayoutConstraint.activate(
            [cancelButton.topAnchor.constraint(equalTo: startButton.bottomAnchor,
                                               constant: Constants.cancelButtonTopAnchor),
             cancelButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             cancelButton.widthAnchor.constraint(equalToConstant: Constants.buttonsWidthAnchor),
             cancelButton.heightAnchor.constraint(equalToConstant: Constants.buttonsHeightAnchor)
            ]
        )
        
        UIButton.setFloatingButtonConstraints(view: self, floatingButton: floatingButton)
//      
    }
}


// MARK: - Constants

private struct Constants {
    
    static let backgroundImage = UIImage(named: "backgroundDown")
    
    static let timerLabelText = "25:00"
    static let segmentedTitle0 = "Focus"
    static let segmentedTitle1 = "Rest"
    static let segmentedTitle2 = "Long Rest"
    
    static let cancelButtonBackgroundColor = UIColor.red
    static let startButtonBackgroundColor = UIColor.systemGreen
    
    static let focusRestSegmentedHeightAncor: CGFloat = 25
    static let focusRestSegmentedTopAncor: CGFloat = 90
    
    static let cancelButtonBottomAnchor: CGFloat = -150
    static let cancelButtonTopAnchor: CGFloat = 5
    
    static let startButtonBottomAnchor: CGFloat = -10
    static let startButtonTopAnchor: CGFloat = .radiusForPomodoroTimer + .widthForCirclePomodoroTimer + 20
    
    static let buttonsWidthAnchor: CGFloat = 150
    static let buttonsHeightAnchor: CGFloat = 50
    static let buttonsCornerRadius: CGFloat = 10
}
