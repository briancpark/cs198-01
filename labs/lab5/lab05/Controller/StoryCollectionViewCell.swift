//
//  StoryCollectionViewCell.swift
//  lab05
//
//  Created by Shyam Kumar on 3/10/21.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func layoutSubviews() {
        profileImageView.layer.cornerRadius = 30
        drawCircle()
    }
    
    func drawCircle() {
        let circularPath = UIBezierPath(arcCenter: profileImageView.center, radius: profileImageView.bounds.width / 2 + 5, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.darkGray.cgColor
        shapeLayer.lineWidth = 1.5
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        
        shapeLayer.strokeEnd = 1
        layer.addSublayer(shapeLayer)
    }
    
    func setup(profile: UIImage, username: String) {
        profileImageView.image = profile
        usernameLabel.text = username
    }
    
}
