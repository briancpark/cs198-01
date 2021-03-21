//
//  StoryModel.swift
//  lab05
//
//  Created by Shyam Kumar on 3/10/21.
//

import Foundation
import UIKit
import Firebase

class StoryModel {
    var stories: [Story] = []
    
    func createStories(completion: @escaping () -> Void) {
        stories = []
        stories.append(Story(profileImage: UIImage(named: "profile-image-1")!, username: "instagram"))
        stories.append(Story(profileImage: UIImage(named: "profile-image-2")!, username: "nike"))
        stories.append(Story(profileImage: UIImage(named: "profile-image-3")!, username: "natgeo"))
        stories.append(Story(profileImage: UIImage(named: "profile-image-4")!, username: "nasa"))
        stories.append(Story(profileImage: UIImage(named: "profile-image-5")!, username: "adidas"))
        retrieveFromFirestore {
            completion()
        }
    }
    
    func writeStoryToFirestore(image: UIImage, username: String = "you", completion: @escaping () -> Void) {
        // https://firebase.google.com/docs/firestore/manage-data/add-data
        // ADDS AN IMAGE TO THE STORY OF username
        // WE RECOMMEND YOU SET UP FIRESTORE IN THE FOLLOWING FASHION
            // stories -> {username} -> array of imagePaths
        // IF THE DOCUMENT stories/{username} already exists, simply add to the array of imagePaths
        // ELSE CREATE THE DOCUMENT stories/{username} with an array of imagePaths (this array should only have one value)
        // USE uploadImageToFirestore TO UPLOAD THE IMAGE TO STORAGE
    }
    
    func uploadImageToFirestore(image: UIImage, path: String, completion: @escaping () -> Void) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let spaceRef = storageRef.child(path)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        
        spaceRef.putData(image.pngData()!, metadata: metadata) {fin , error in
            completion()
        }
    }
    
    func retrieveFromFirestore(completion: @escaping () -> Void) {
        // ITERATE OVER DOCUMENTS IN stories
            // ITERATE OVER THE imagePath ARRAY FOR EACH DOCUMENT
            // DOWNLOAD AND ADD EACH IMAGE TO A STORY
            // APPEND THE STORY TO stories
    }
    
    func retrieveImageFromStorage(path: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child(path)
        
        ref.getData(maxSize: 30 * 1024 * 1024, completion: {data, error in
            if let error = error {
                print(error)
                return
            } else {
                if let data = data {
                    completion(UIImage(data: data) ?? UIImage())
                }
            }
        })
    }
}

struct Story {
    var profileImage: UIImage
    let username: String
    var images: [UIImage] = []
    
    init(profileImage: UIImage = UIImage(), username: String) {
        self.profileImage = profileImage
        self.username = username
    }
}
