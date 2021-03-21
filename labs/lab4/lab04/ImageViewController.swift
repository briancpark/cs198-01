//
//  ImageViewController.swift
//  lab04
//
//  Created by Brian Park on 3/21/21.
//

import UIKit

class ImageViewController: UIViewController {
    
    
    @IBOutlet weak var tappedImageView: UIImageView!
    
    var tappedImage: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tappedImageView.image = tappedImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
