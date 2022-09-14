//
//  PomodoroViewController + RestTimer.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 07.08.2022.
//

import UIKit

//MARK: - Rest

extension PomodoroViewController {
    
    func startRestButtonTapped() {
        pomodoroView.cancelButton.isHidden = false
        if !isTimerStart {
            drawForeLayer()
            startResumeAnimation()
            startRestTimer()
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
    
    @objc func cancelRestButtonTapped() {
        stopAnimation()
        timer.invalidate()
        restTime = 300
        pomodoroView.timerLabel.text = "05:00"
        isTimerStart = false
        pomodoroView.cancelButton.isHidden = true
        pomodoroView.startButton.setTitle("Start", for: .normal)
        pomodoroView.startButton.backgroundColor = .systemGreen
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
    
    @objc func updateRestTimer() {
        if restTime < 1 {
            pomodoroView.cancelButton.isHidden = true
            pomodoroView.startButton.setTitle("Start", for: .normal)
            pomodoroView.startButton.backgroundColor = .systemGreen
            timer.invalidate()
            restTime = 300
            pomodoroView.timerLabel.text = "05:00"
            isTimerStart = false
        } else {
            restTime -= 1
            pomodoroView.timerLabel.text = stringRestTime()
        }
    }
    
    func stringRestTime() -> String {
        let minutes = Int(restTime) / 60 % 60
        let seconds = Int(restTime) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    func startRestAnimation() {
        resetAnimation()
        foreProgressLayer.strokeEnd = 0.0
        animation.keyPath = "strokeEnd"
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 300
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        foreProgressLayer.add(animation, forKey: "strokeEnd")
        isAnimationStarted = true
    }
}
