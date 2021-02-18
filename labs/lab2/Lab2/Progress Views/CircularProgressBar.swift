//
//  CircularProgressBar.swift
//  Lab2
//
//  Created by Shyam Kumar on 2/15/21.
//

import UIKit

var univUIColor: UIColor = ProgressColors.yellow

@IBDesignable
class CircularProgressBar: UIView {
    @IBInspectable var ringWidth: CGFloat = 7
    @IBInspectable var progress: CGFloat = 0
    
    let progressLayer = CAShapeLayer()
    
    

    override func draw(_ rect: CGRect) {
        let backgroundMask = CAShapeLayer()
        backgroundMask.path = UIBezierPath(ovalIn: rect.insetBy(dx: ringWidth / 2, dy: ringWidth / 2)).cgPath
        backgroundMask.lineWidth = ringWidth
        backgroundMask.fillColor = nil
        backgroundMask.strokeColor = UIColor.black.cgColor
        
        layer.mask = backgroundMask
        
        progressLayer.path = UIBezierPath(ovalIn: rect.insetBy(dx: ringWidth / 2, dy: ringWidth / 2)).cgPath
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progress
        progressLayer.lineWidth = ringWidth
        progressLayer.fillColor = nil
        progressLayer.strokeColor = univUIColor.cgColor
        progressLayer.lineCap = .round
        
        layer.addSublayer(progressLayer)
        layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi / 180), 0, 0, 1)
    }
    
    func animateProgress(completion: @escaping () -> Void) {
        setNeedsDisplay()
        UIView.transition(with: self, duration: 0.4, options: .curveEaseInOut, animations: {
            self.layer.displayIfNeeded()
        }, completion: {fin in
            if fin {
                completion()
            }
        })
    }
    
    func addTenPercent() {
        if progress <= 0.9 {
            progress += CGFloat(0.1)
        }
    }
    
    func subtractTenPercent() {
        if progress >= 0.1 {
            progress -= CGFloat(0.1)
        }
    }

}
