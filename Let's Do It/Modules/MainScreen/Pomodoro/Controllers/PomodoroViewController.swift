//
//  PomodoroViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

// MARK: - PomodoroViewController

class PomodoroViewController: UIViewController/*ContentViewController*/, CAAnimationDelegate {
    
    // MARK: Properties
    
    let foreProgressLayer = CAShapeLayer()
    let backProgressLayer = CAShapeLayer()
    let animation = CABasicAnimation(keyPath: Constants.keyPath)
    
    let floatingButton = FloatingButton()
    var timer = Timer()
    var isTimerStart = false
    var isAnimationStarted = false
    var focusTime = Constants.focusTime
    var restTime = Constants.restTime
    var longRestTime = Constants.longRestTime
    var isSetOfPomodoroOn = false
    
    
    let pomodoroView = PomodoroView()

    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pomodoro"
        
        configureView()
        setActionsForButtons()
    }
    
    override func loadView() {
        super.loadView()
        view = pomodoroView
    }
}

// MARK: - @objs extentions

@objc extension PomodoroViewController {
    
    private func segmentedValueChanged() {
        switch pomodoroView.focusRestSegmented.selectedSegmentIndex {
        case 0 : pomodoroView.timerLabel.text = Constants.focusTimeText
        case 1 : pomodoroView.timerLabel.text = Constants.restTimeText
        case 2 : pomodoroView.timerLabel.text = Constants.longRestTimeText
        default: pomodoroView.timerLabel.text = Constants.defaultTimeText
        }
    }
    
    private func startButtonTapped() {
        switch pomodoroView.focusRestSegmented.selectedSegmentIndex {
        case 0 : startFocusButtonTapped()
        case 1 : startRestButtonTapped()
        case 2 : startLongRestButtonTapped()
        default: startFocusButtonTapped()
        }
    }
    
    private func cancelButtonTapped() {
        switch pomodoroView.focusRestSegmented.selectedSegmentIndex {
        case 0 : cancelFocusButtonTapped()
        case 1 : cancelRestButtonTapped()
        case 2 : cancelLongRestButtonTapped()
        default: cancelFocusButtonTapped()
        }
    }
    
    private func addButtonTapped() {
        print("add")
    }
}

// MARK: - Private Methods

extension PomodoroViewController {
        
    private func configureView() {
        drawBackLayer()
    }
    
    private func setActionsForButtons() {
        pomodoroView.focusRestSegmented.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        pomodoroView.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        pomodoroView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        pomodoroView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
}


// MARK: - Constants

private struct Constants {
    
    static let focusTime: Int = 1500
    static let restTime: Int = 300
    static let longRestTime: Int = 900
    
   
    static let focusTimeText = "25:00"
    static let restTimeText = "05:00"
    static let longRestTimeText = "15:00"
    static let defaultTimeText = "00:00"
    static let keyPath = "strokeEnd"
}

