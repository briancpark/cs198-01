//
//  StoryModel.swift
//  lab05
//
//  Created by Shyam Kumar on 3/10/21.
//

import Foundation
import UIKit

class StoryModel {
    var stories: [Story] = []
    
    func createStories() {
        stories.append(Story(profileImage: UIImage(named: "profile-image-1")!, username: "instagram"))
        stories.append(Story(profileImage: UIImage(named: "profile-image-2")!, username: "nike"))
        stories.append(Story(profileImage: UIImage(named: "profile-image-3")!, username: "natgeo"))
        stories.append(Story(profileImage: UIImage(named: "profile-image-4")!, username: "nasa"))
        stories.append(Story(profileImage: UIImage(named: "profile-image-5")!, username: "adidas"))
    }
}

struct Story {
    let profileImage: UIImage
    let username: String
    
    init(profileImage: UIImage, username: String) {
        self.profileImage = profileImage
        self.username = username
    }
}
