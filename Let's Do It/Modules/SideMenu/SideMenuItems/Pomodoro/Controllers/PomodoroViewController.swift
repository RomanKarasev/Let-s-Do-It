//
//  PomodoroViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

// MARK: - PomodoroViewController

class PomodoroViewController: ContentViewController, CAAnimationDelegate {
    
    // MARK: Properties
    
    let foreProgressLayer = CAShapeLayer()
    let backProgressLayer = CAShapeLayer()
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    let idPomodoroCell = "idPomodoroCell"
    
    var timer = Timer()
    var isTimerStart = false
    var isAnimationStarted = false
    var focusTime = 1500
    var restTime = 300
    var longRestTime = 900
    var isSetOfPomodoroOn = false
    
    // Views
    let pomodoroView = PomodoroView()

    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = pomodoroView
        title = "Pomodoro"
        
        configureView()
        setActionsForButtons()
    }
    
    // MARK: Methods
    func configureView() {
        drawBackLayer()
    }
    
    func setActionsForButtons() {
        pomodoroView.focusRestSegmented.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        pomodoroView.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        pomodoroView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
//        pomodoroView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc func segmentedValueChanged() {
        switch pomodoroView.focusRestSegmented.selectedSegmentIndex {
        case 0 : pomodoroView.timerLabel.text = "25:00"
        case 1 : pomodoroView.timerLabel.text = "05:00"
        case 2 : pomodoroView.timerLabel.text = "15:00"
        default: pomodoroView.timerLabel.text = "00:00"
        }
    }
    
    @objc func startButtonTapped() {
        switch pomodoroView.focusRestSegmented.selectedSegmentIndex {
        case 0 : startFocusButtonTapped()
        case 1 : startRestButtonTapped()
        case 2 : startLongRestButtonTapped()
        default: startFocusButtonTapped()
        }
    }
    
    @objc func cancelButtonTapped() {
        switch pomodoroView.focusRestSegmented.selectedSegmentIndex {
        case 0 : cancelFocusButtonTapped()
        case 1 : cancelRestButtonTapped()
        case 2 : cancelLongRestButtonTapped()
        default: cancelFocusButtonTapped()
        }
    }
}

