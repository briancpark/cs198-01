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
        posts = []
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
        let db = Firestore.firestore()
        let imagePath = "images/\(UUID().uuidString)"
        
        db.collection("posts").addDocument(data: [
            "username": username,
            "caption": caption,
            "imagePath": imagePath
        ]) {_ in
            self.uploadImageToFirestore(image: image, path: imagePath, completion: {
                completion()
            })
        }
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
        let db = Firestore.firestore()
        
        db.collection("posts").getDocuments(completion: {querySnapshot, err in
            if let err = err {
                print(err)
                return
            } else {
                if querySnapshot!.documents.isEmpty {
                    return
                }
                for i in 0...querySnapshot!.documents.count-1 {
                    let document = querySnapshot!.documents[i]
                    let data = document.data()
                    
                    let username = (data["username"] ?? "you") as! String
                    let caption = (data["caption"] ?? "test caption") as! String
                    let imagePath = (data["imagePath"] ?? "") as! String
                    
                    self.retrieveImageFromStorage(path: imagePath, completion: { image in
                        self.posts.append(Post(image: image, username: username, caption: caption))
                        if i == querySnapshot!.documents.count - 1 {
                            completion()
                        }
                    })
                }
            }
        })
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
