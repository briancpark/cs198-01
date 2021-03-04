//
//  ImageModel.swift
//  lab04
//
//  Created by Shyam Kumar on 3/3/21.
//

import Foundation
import UIKit

//LECTURE SLIDES: https://docs.google.com/presentation/d/1OoSlINqensAIkbwFMU-njGIAsKWG6RvgOqd1PagkxAE/edit#slide=id.g7e9abaa2a8_1_89

class ImageModel {
    var images: [UIImage] = []
    
    //POPULATES images ARRAY WHEN THE CLASS IS INITIALIZED
    init() {
        for i in 1...12 {
            images.append(UIImage(named: "image-\(i)") ?? UIImage())
        }
    }
    
    func shuffle() {
        //YOUR CODE HERE
        
        //Randomly shuffle the images array
    }
}
