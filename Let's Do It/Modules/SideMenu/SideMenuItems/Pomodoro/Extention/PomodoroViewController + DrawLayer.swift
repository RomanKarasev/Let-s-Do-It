//
//  PomodoroViewController + DrawLayer.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 07.08.2022.
//

import UIKit

// MARK: - DrawLayer

extension PomodoroViewController {
    
    func drawBackLayer() {
        
        backProgressLayer.path = UIBezierPath(
            arcCenter: CGPoint(
                x: UIScreen.main.bounds.midX,
                y: UIScreen.main.bounds.midY
            ),
            radius: .radiusForPomodoroTimer,
            startAngle: -90.degreesToRadians,
            endAngle: 270.degreesToRadians,
            clockwise: true
        ).cgPath
        
        backProgressLayer.strokeColor = UIColor.mainColor.cgColor
        backProgressLayer.fillColor = UIColor.clearColor.cgColor
        backProgressLayer.lineWidth = .widthForCirclePomodoroTimer
        pomodoroView.downBackground.layer.addSublayer(backProgressLayer)
    }
    
    func drawForeLayer() {
        foreProgressLayer.path = UIBezierPath(
            arcCenter: CGPoint(
                x: UIScreen.main.bounds.midX,
                y: UIScreen.main.bounds.midY
            ),
            radius: .radiusForPomodoroTimer,
            startAngle: -90.degreesToRadians,
            endAngle: 270.degreesToRadians,
            clockwise: true
        ).cgPath
        
        foreProgressLayer.strokeColor = UIColor.accentColor.cgColor
        foreProgressLayer.fillColor = UIColor.clearColor.cgColor
        foreProgressLayer.lineWidth = .widthForTimeLineCirclePomodoroTimer
        pomodoroView.downBackground.layer.addSublayer(foreProgressLayer)
    }
}

// MARK: - degreesToRadians

extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}

// MARK: - Constants

private struct Constants {
    
    static let focusTime: Int = 1500
    static let restTime: Int = 300
    static let longRestTime: Int = 900
   
    
    static let keyPath = "strokeEnd"
}

