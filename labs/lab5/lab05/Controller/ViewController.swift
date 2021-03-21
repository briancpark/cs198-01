//
//  ViewController.swift
//  lab05
//
//  Created by Shyam Kumar on 3/10/21.
//

//LECTURE SLIDES: https://docs.google.com/presentation/d/1SaIcS85ZPVtB8KQaQaU1VsASnXiDDTyAxUGVkp3C5vw/edit#slide=id.g62673eb36a_0_89

//SET CUSTOM CLASS FOR COLLECTION VIEW CELL AND TABLE VIEW CELL
//SET ID FOR COLLECTION VIEW CELL AND TABLE VIEW CELL

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    
    var feedModel = FeedModel()
    var storyModel = StoryModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SET COLLECTION VIEW DELEGATE AND DATA SOURCE
        storyCollectionView.dataSource = self
        storyCollectionView.delegate = self
        //SET TABLE VIEW DELEGATE AND DATA SOURCE
        feedTableView.dataSource = self
        feedTableView.delegate = self
        feedModel.createFeed()
        storyModel.createStories()
    }


}

// COLLECTION VIEW METHODS
extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // COUNT NUMBER OF ELEMENTS IN stories ARRAY IN STORYMODEL
        return storyModel.stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // DEQUEUE REUSABLE CELL WITH ID
        // CAST TO storyCollectionViewCell
        // CALL SETUP ON CELL
        // RETURN CELL
        if let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: "story", for: indexPath) as? StoryCollectionViewCell {
            let currentStory = storyModel.stories[indexPath.row]
            cell.setup(profile: currentStory.profileImage, username: currentStory.username)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

// TABLE VIEW METHODS
extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // COUNT NUMBER OF ELEMENTS IN posts ARRAY IN FEEDMODEL
        return feedModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // DEQUEUE REUSABLE CELL WITH ID
        // CAST TO postTableViewCell
        // CALL SETUP ON CELL
        // RETURN CELL
        if let cell = feedTableView.dequeueReusableCell(withIdentifier: "post", for: indexPath) as? PostTableViewCell {
            let currentPost = feedModel.posts[indexPath.row]
            cell.setup(image: currentPost.image, username: currentPost.username, likes: currentPost.likes, caption: currentPost.caption)
            return cell
        }
        return UITableViewCell()
    }
}

