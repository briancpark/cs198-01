//
//  FeedModel.swift
//  lab05
//
//  Created by Shyam Kumar on 3/10/21.
//

import Foundation
import UIKit
import Firebase

class FeedModel {
    var posts: [Post] = []
    
    func createFeed(completion: @escaping () -> Void) {
        posts.append(Post(image: UIImage(named: "profile-image-1")!, username: "instagram", caption: "caption 1"))
        posts.append(Post(image: UIImage(named: "profile-image-2")!, username: "nike", caption: "caption 2"))
        posts.append(Post(image: UIImage(named: "profile-image-3")!, username: "natgeo", caption: "caption 3"))
        posts.append(Post(image: UIImage(named: "profile-image-4")!, username: "nasa", caption: "caption 4"))
        posts.append(Post(image: UIImage(named: "profile-image-5")!, username: "adidas", caption: "caption 5"))
        
        retrieveFromFirestore() {
            completion()
        }
    }
    
    func writePostToFirestore(image: UIImage, caption: String = "test caption", username: String = "you", completion: @escaping () -> Void) {
        // CREATE A UNIQUE PATH FOR IMAGE IN STORAGE
        // USE addDocument TO ADD THE CAPTION, USERNAME, AND IMAGEPATH TO FIRESTORE
        // USE uploadImageToFirestore TO PUT THE IMAGE IN STORAGE
        // CALL completion() WHEN FINISHED
    }
    
    func uploadImageToFirestore(image: UIImage, path: String, completion: @escaping () -> Void) {
        // USE putData TO PLACE image IN STORAGE
        // CALL completion() WHEN FINISHED
    }
    
    func retrieveFromFirestore(completion: @escaping () -> Void) {
        // USE getDocuments TO GET LIST OF DOCUMENTS FROM COLLECTION IN FIRESTORE
        // LOOP OVER DOCUMENTS AND EXTRACT
            // username
            // caption
            // imagePath
                // USE retrieveImageFromStorage TO GET UIIMAGE FROM imagePath
                // APPEND A NEW POST TO POSTS
        // CALL completion() WHEN DONE
    }
    
    func retrieveImageFromStorage(path: String, completion: @escaping (UIImage) -> Void) {
        // USE getData TO RETRIEVE IMAGE WITH path FROM STORAGE
        // CALL completion() WHEN DONE
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
