//
//  FeedModel.swift
//  lab05
//
//  Created by Shyam Kumar on 3/10/21.
//

import Foundation
import UIKit

class FeedModel {
    var posts: [Post] = []
    
    func createFeed() {
        posts.append(Post(image: UIImage(named: "profile-image-1")!, username: "instagram", caption: "caption 1"))
        posts.append(Post(image: UIImage(named: "profile-image-2")!, username: "nike", caption: "caption 2"))
        posts.append(Post(image: UIImage(named: "profile-image-3")!, username: "natgeo", caption: "caption 3"))
        posts.append(Post(image: UIImage(named: "profile-image-4")!, username: "nasa", caption: "caption 4"))
        posts.append(Post(image: UIImage(named: "profile-image-5")!, username: "adidas", caption: "caption 5"))
    }
}

struct Post {
    let image: UIImage
    let username: String
    let caption: String
    let likes: Int = Int.random(in: 100..<1000)
    
    init(image: UIImage, username: String, caption: String) {
        self.image = image
        self.username = username
        self.caption = caption
    }
}
