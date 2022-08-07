//
//  PomodoroViewController + FocusTimer.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 07.08.2022.
//

import UIKit

extension PomodoroViewController {
    
    func startFocusButtonTapped() {
        pomodoroView.cancelButton.isHidden = false
        if !isTimerStart {
            drawForeLayer()
            startResumeAnimation()
            startFocusTimer()
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
    
    @objc func cancelFocusButtonTapped() {
        stopAnimation()
        timer.invalidate()
        focusTime = 1500
        pomodoroView.timerLabel.text = "25:00"
        isTimerStart = false
        pomodoroView.cancelButton.isHidden = true
        pomodoroView.startButton.setTitle("Start", for: .normal)
        pomodoroView.startButton.backgroundColor = .systemGreen
    }
    
    func startFocusTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateFocusTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateFocusTimer() {
        if focusTime < 1 {
            pomodoroView.cancelButton.isHidden = true
            pomodoroView.startButton.setTitle("Start", for: .normal)
            pomodoroView.startButton.backgroundColor = .systemGreen
            timer.invalidate()
            focusTime = 1500
            pomodoroView.timerLabel.text = "25:00"
            isTimerStart = false
        } else {
            focusTime -= 1
            pomodoroView.timerLabel.text = stringFocusTime()
        }
    }
    
    func stringFocusTime() -> String {
        let minutes = Int(focusTime) / 60 % 60
        let seconds = Int(focusTime) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    func startFocusAnimation() {
        resetAnimation()
        foreProgressLayer.strokeEnd = 0.0
        animation.keyPath = "strokeEnd"
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1500
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        foreProgressLayer.add(animation, forKey: "strokeEnd")
        isAnimationStarted = true
    }
}
