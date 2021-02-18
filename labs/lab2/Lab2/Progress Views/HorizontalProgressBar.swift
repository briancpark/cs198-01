//
//  HorizontalProgressBar.swift
//  Lab2
//
//  Created by Shyam Kumar on 2/15/21.
//

import UIKit

@IBDesignable
class HorizontalProgressBar: UIView {
    @IBInspectable var barBackgroundColor: UIColor = .gray
    
    var progress: CGFloat = 0
    
    var progressLayer = CALayer()
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let backgroundMask = CAShapeLayer()
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).cgPath
        layer.mask = backgroundMask
        
        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))
        progressLayer.frame = progressRect
        
        layer.addSublayer(progressLayer)
        progressLayer.backgroundColor = univUIColor.cgColor
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
    
    
    // Adds 10 percent to progress bar and returns new progress as an Int
    
    func addTenPercent() -> Int {
        if progress <= 0.9 {
            progress += CGFloat(0.1)
        }
        
        return Int((progress * 100).rounded(.toNearestOrAwayFromZero))
    }
    
    // Subtracts 10 percent to progress bar and returns new progress as an Int
    
    func subtractTenPercent() -> Int {
        if progress >= 0.1 {
            progress -= CGFloat(0.1)
        }
        
        return Int((progress * 100).rounded(.toNearestOrAwayFromZero))
    }

}
