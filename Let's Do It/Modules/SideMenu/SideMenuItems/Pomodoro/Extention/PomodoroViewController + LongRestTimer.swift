//
//  PomodoroViewController + LongRestTimer.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 07.08.2022.
//

import UIKit

extension PomodoroViewController {
    
    func startLongRestButtonTapped() {
        pomodoroView.cancelButton.isHidden = false
        if !isTimerStart {
            drawForeLayer()
            startResumeAnimation()
            startLongRestTimer()
            isTimerStart = true
            pomodoroView.startButton.setTitle("Pause", for: .normal)
            pomodoroView.startButton.backgroundColor = .systemGreen
        } else {
            pauseAnimation()
            timer.invalidate()
            isTimerStart = false
            pomodoroView.startButton.setTitle("Resume", for: .normal)
            pomodoroView.startButton.backgroundColor = .systemGreen
        }
    }
    
    @objc func cancelLongRestButtonTapped() {
        stopAnimation()
        timer.invalidate()
        longRestTime = 900
        pomodoroView.timerLabel.text = "15:00"
        isTimerStart = false
        pomodoroView.cancelButton.isHidden = true
        pomodoroView.startButton.setTitle("Start", for: .normal)
        pomodoroView.startButton.backgroundColor = .systemGreen
    }
    
    func startLongRestTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateLongRestTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateLongRestTimer() {
        if longRestTime < 1 {
            pomodoroView.cancelButton.isHidden = true
            pomodoroView.startButton.setTitle("Start", for: .normal)
            pomodoroView.startButton.backgroundColor = .systemGreen
            timer.invalidate()
            longRestTime = 900
            pomodoroView.timerLabel.text = "15:00"
            isTimerStart = false
        } else {
            longRestTime -= 1
            pomodoroView.timerLabel.text = stringLongRestTime()
        }
    }
    
    func stringLongRestTime() -> String {
        let minutes = Int(longRestTime) / 60 % 60
        let seconds = Int(longRestTime) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    func startLongRestAnimation() {
        resetAnimation()
        foreProgressLayer.strokeEnd = 0.0
        animation.keyPath = "strokeEnd"
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 900
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        foreProgressLayer.add(animation, forKey: "strokeEnd")
        isAnimationStarted = true
    }
}
