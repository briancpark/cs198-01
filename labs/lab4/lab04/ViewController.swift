//
//  ViewController.swift
//  lab04
//
//  Created by Shyam Kumar on 3/3/21.
//

import UIKit

//LECTURE SLIDES: https://docs.google.com/presentation/d/1OoSlINqensAIkbwFMU-njGIAsKWG6RvgOqd1PagkxAE/edit#slide=id.g7e9abaa2a8_1_89

class ViewController: UIViewController {
    
    @IBOutlet weak var outerStackView: UIStackView!
    @IBOutlet weak var shuffleButton: UIButton!
    
    var primaryColor = UIColor(red:0.99, green:0.24, blue:0.27, alpha:1.0)
    
    var imageModel = ImageModel()
    
    var selectedImage: UIImage? =  nil // Image to pass to new ViewController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        
        //STYYLING SHUFFLE BUTTON
        shuffleButton.setTitleColor(.white, for: .normal)
        shuffleButton.backgroundColor = primaryColor
        shuffleButton.layer.cornerRadius = 5
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // arrangedSubviews returns an array of UIViews inside the stack view
        for innerSubView in outerStackView.arrangedSubviews {
            // We know that innerSubView is of type UIStackView, but arrangedSubviews returns it as
            // type UIView so we have to cast it to UIStackView
            guard let innerStackView = innerSubView as? UIStackView else { return }
            
            for innermostView in innerStackView.arrangedSubviews {
                guard let imageView = innermostView as? UIImageView else { return }
                
                // ADDING TAP GESTURE TO ALL IMAGES
                
                // Adding a tap gesture allows our image to act like a button, every type the image is tapped,
                // our function imageTapped gets called
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                imageView.addGestureRecognizer(tapGesture)
                imageView.isUserInteractionEnabled = true
                
                //STYLING ALL IMAGES
                imageView.layer.borderWidth = 2.0
                imageView.layer.masksToBounds = false
                imageView.layer.borderColor = UIColor.white.cgColor
                imageView.layer.cornerRadius = imageView.frame.width / 2
                imageView.clipsToBounds = true
            }
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if let currentImageTapped = tapGestureRecognizer.view as? UIImageView {
            //YOUR CODE HERE
            
            // Set selectedImage
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //YOUR CODE HERE
        
        // Pass selectedImage to your new ViewController
    }
    
    @IBAction func shuffleTapped(_ sender: Any) {
        // Call the shuffle function of ImageModel
        // Iterate through the imageViews on the screen (see lines 32- 36 for an example) and replace the images
            // Use imageView.image to replace the image of an imageView
    }
    
    
}

