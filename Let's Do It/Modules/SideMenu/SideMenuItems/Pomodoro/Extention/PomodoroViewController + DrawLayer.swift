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
            radius: 150,
            startAngle: -90.degreesToRadians,
            endAngle: 270.degreesToRadians,
            clockwise: true
        ).cgPath
        
        backProgressLayer.strokeColor = UIColor.systemBlue.cgColor
        backProgressLayer.fillColor = UIColor.clear.cgColor
        backProgressLayer.lineWidth = 15
        pomodoroView.downBackground.layer.addSublayer(backProgressLayer)
    }
    
    func drawForeLayer() {
        foreProgressLayer.path = UIBezierPath(
            arcCenter: CGPoint(
                x: UIScreen.main.bounds.midX,
                y: UIScreen.main.bounds.midY
            ),
            radius: 150,
            startAngle: -90.degreesToRadians,
            endAngle: 270.degreesToRadians,
            clockwise: true
        ).cgPath
        
        foreProgressLayer.strokeColor = UIColor.systemOrange.cgColor
        foreProgressLayer.fillColor = UIColor.clear.cgColor
        foreProgressLayer.lineWidth = 13
        pomodoroView.downBackground.layer.addSublayer(foreProgressLayer)
    }
}

// MARK: - degreesToRadians

extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
