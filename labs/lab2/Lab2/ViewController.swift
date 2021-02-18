//
//  ViewController.swift
//  Lab2
//
//  Created by Shyam Kumar on 2/15/21.
//

import UIKit

//LECTURE SLIDES: https://docs.google.com/presentation/d/1ENf_I53ZZ5aEoNcveKTuJXAes4pZH8EP-hglAN3_nPU/edit#slide=id.g62673eb36a_0_89

class ViewController: UIViewController {
    @IBOutlet weak var horizontalProgressBar: HorizontalProgressBar!
    @IBOutlet weak var circularProgressBar: CircularProgressBar!
    @IBOutlet weak var addTenPercentButton: UIButton!
    @IBOutlet weak var subtractTenPercentButton: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var currentProgress: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addTenPercentButton.layer.cornerRadius = 30
        subtractTenPercentButton.layer.cornerRadius = 30
        
        addTenPercentButton.backgroundColor = ProgressColors.green.withAlphaComponent(0.2)
        subtractTenPercentButton.backgroundColor = ProgressColors.red.withAlphaComponent(0.2)
    }
    
    // MARK:- PART 1
    
    /* CONTROL-DRAG from +10% button and -10% button to below in order to create an ACTION (SLIDE 38)
       
       When the +10% button is pressed, we want to:
     
            Add 10% to the fill of horizontalProgressBar
            Add 10% to the fill of circularProgressBar
            Animate our changes                                   horizontalProgressBar.animateProgress {}
            Change progressLabel to reflect our new progress      progressLabel.text = ...
     
       When the -10% button is pressed, we want to:
    
            Subtract 10% from the fill of horizontalProgressBar
            Subtract 10% from the fill of circularProgressBar      circularProgressBar.subtractTenPercent()
            Animate our changes
            Change progressLabel to reflect our new progress       progressLabel.text = ...
     
     
       USE addTenPercent() and subtractTenPercent() FUNCTIONS IN HorizontalProgressView.swift
       AND CircularProgressBar.swift
     
       ***
        horizontalProgressBar.addTenPercent() and horizontalProgressBar.subtractTenPercent()
        return an Int containing the updated progress. Use that integer and string
        interpolation to update progressLabel.text
        
        The progress of horizontalProgressBar and circularProgressBar will always be the same
       ***
        
            
    */
    
    
    //MARK:- PART 2
    
    /*
     Fill in the switch statement below to change the color of the UI with the segmented control.
        
        1) Based on the new selectedSegmentedIndex, determine the new color and grab it from the
           struct ProgressColors (see below)
     
        2) Call changeUIColor with the new UI color as a parameter
    */
    
    @IBAction func backgroundColorChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return // REPLACE WITH CODE
        case 1:
            return // REPLACE WITH CODE
        case 2:
            return // REPLACE WITH CODE
        default:
            return
        }
    }
    
    func changeUIColor(_ color: UIColor) {
        segmentedControl.selectedSegmentTintColor = color
        univUIColor = color
        
        UIView.animate(withDuration: 0.3, animations: {
            self.horizontalProgressBar.alpha = 0
            self.circularProgressBar.alpha = 0
            self.progressLabel.alpha = 0
        }, completion: {fin in
            if fin {
                self.horizontalProgressBar.progressLayer.backgroundColor = color.cgColor
                self.circularProgressBar.progressLayer.strokeColor = color.cgColor
                self.progressLabel.textColor = color
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.horizontalProgressBar.alpha = 1
                    self.circularProgressBar.alpha = 1
                    self.progressLabel.alpha = 1
                }, completion: nil)
            }
        })
    }
    
}

public struct ProgressColors {
    static var yellow: UIColor = UIColor(red:1.00, green:0.80, blue:0.41, alpha:1.0)
    static var green: UIColor = UIColor(red:0.41, green:1.00, blue:0.57, alpha:1.0)
    static var red: UIColor = UIColor(red:1.00, green:0.41, blue:0.41, alpha:1.0)
}

