//
//  PomodoroViewController + Animation.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 07.08.2022.
//

import UIKit

// MARK: - Animation

extension PomodoroViewController {
    
    func startResumeAnimation() {
        
        if !isAnimationStarted {
            switch pomodoroView.focusRestSegmented.selectedSegmentIndex {
            case 0 : startFocusAnimation()
            case 1 : startRestAnimation()
            case 2 : startLongRestAnimation()
            default: startFocusAnimation()
            }
        } else {
            resumeAnimation()
        }
    }
    
    func startAnimation() {
        resetAnimation()
        foreProgressLayer.strokeEnd = 0.0
        animation.keyPath = Constants.keyPath
        animation.fromValue = 0
        animation.toValue = 1
        switch pomodoroView.focusRestSegmented.selectedSegmentIndex {
        case 0 : animation.duration = CFTimeInterval(Constants.focusTime)
        case 1 : animation.duration = CFTimeInterval(Constants.restTime)
        case 2 : animation.duration = CFTimeInterval(Constants.longRestTime)
        default: animation.duration = 0
        }
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        foreProgressLayer.add(animation, forKey: Constants.keyPath)
        isAnimationStarted = true
    }
    
    func resetAnimation() {
        foreProgressLayer.speed = 1.0
        foreProgressLayer.timeOffset = 0.0
        foreProgressLayer.beginTime = 0.0
        foreProgressLayer.strokeEnd = 0.0
        isAnimationStarted = false
    }
    
    func pauseAnimation() {
        let pausedTime = foreProgressLayer.convertTime(CACurrentMediaTime(), from: nil)
        foreProgressLayer.speed = 0.0
        foreProgressLayer.timeOffset = pausedTime
    }
    func resumeAnimation() {
        let pausedTime = foreProgressLayer.timeOffset
        foreProgressLayer.speed = 1.0
        foreProgressLayer.timeOffset = 0.0
        foreProgressLayer.beginTime = 0.0
        let timeSincePaused = foreProgressLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        foreProgressLayer.beginTime = timeSincePaused
    }
    
    func stopAnimation() {
        foreProgressLayer.speed = 1.0
        foreProgressLayer.timeOffset = 0.0
        foreProgressLayer.beginTime = 0.0
        foreProgressLayer.strokeEnd = 0.0
        foreProgressLayer.removeAllAnimations()
        isAnimationStarted = false
    }
    
    internal func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        stopAnimation()
    }
}


// MARK: - Constants

private struct Constants {
    
    static let focusTime: Int = 1500
    static let restTime: Int = 300
    static let longRestTime: Int = 900
   
    static let keyPath = "strokeEnd"
}
