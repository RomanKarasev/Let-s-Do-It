//
//  PomodoroViewController + RestTimer.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 07.08.2022.
//

import UIKit

//MARK: - Rest

extension PomodoroViewController {
    
    @objc func cancelRestButtonTapped() {
        stopAnimation()
        timer.invalidate()
        restTime = Constants.restTime
        pomodoroView.timerLabel.text = Constants.restTimeText
        isTimerStart = false
        pomodoroView.cancelButton.isHidden = true
        pomodoroView.startButton.setTitle(.start, for: .normal)
        pomodoroView.startButton.backgroundColor = .systemGreen
    }
    
    @objc func updateRestTimer() {
        if restTime < 1 {
            pomodoroView.cancelButton.isHidden = true
            pomodoroView.startButton.setTitle(.start, for: .normal)
            pomodoroView.startButton.backgroundColor = .systemGreen
            timer.invalidate()
            restTime = Constants.restTime
            pomodoroView.timerLabel.text = Constants.restTimeText
            isTimerStart = false
        } else {
            restTime -= 1
            pomodoroView.timerLabel.text = stringRestTime()
        }
    }
    
    func startRestButtonTapped() {
        pomodoroView.cancelButton.isHidden = false
        if !isTimerStart {
            drawForeLayer()
            startResumeAnimation()
            startRestTimer()
            isTimerStart = true
            pomodoroView.startButton.setTitle(.pause, for: .normal)
            pomodoroView.startButton.backgroundColor = .systemGreen
        } else {
            pauseAnimation()
            timer.invalidate()
            isTimerStart = false
            pomodoroView.startButton.setTitle(.resume, for: .normal)
            pomodoroView.startButton.backgroundColor = .systemGreen
        }
    }
    
    func startRestTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateRestTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    func stringRestTime() -> String {
        let minutes = Int(restTime) / 60 % 60
        let seconds = Int(restTime) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    func startRestAnimation() {
        resetAnimation()
        foreProgressLayer.strokeEnd = 0.0
        animation.keyPath = Constants.keyPath
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = CFTimeInterval(Constants.restTime)
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        foreProgressLayer.add(animation, forKey: Constants.keyPath)
        isAnimationStarted = true
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
