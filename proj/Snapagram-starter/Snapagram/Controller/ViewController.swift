//
//  ViewController.swift
//  lab05
//
//  Created by Shyam Kumar on 3/10/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var feedModel = FeedModel()
    var storyModel = StoryModel()
    
    var imagePickerController = UIImagePickerController()
    
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    var postToFeed = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        storyCollectionView.dataSource = self
        storyCollectionView.delegate = self
        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        imagePickerController.delegate = self
        
        feedModel.createFeed() {
            self.feedTableView.reloadData()
        }
        
        storyModel.createStories() {
            self.storyCollectionView.reloadData()
        }
        
        addButton.tintColor = .white
        
        alert.addAction(UIAlertAction(title: "Post to feed", style: .default, handler: {_ in
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Add to story", style: .default, handler: {_ in
            self.postToFeed = false
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        
        
        self.title = "Snapagram"
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Billabong", size: 30)!]
        navigationController?.navigationBar.isTranslucent = false
        
    }

    @IBAction func showImagePicker(_ sender: Any) {
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = Constants.snapagramGray
        alert.view.tintColor = .white
        present(alert, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            // USE IMAGE
            if postToFeed {
                feedModel.writePostToFirestore(image: image, completion: {
                    self.feedModel.createFeed {
                        self.feedTableView.reloadData()
                    }
                })
            } else {
                storyModel.writeStoryToFirestore(image: image, username: "you", completion: {
                    self.storyModel.createStories {
                        self.storyCollectionView.reloadData()
                    }
                })
            }
        }
        imagePickerController.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        storyModel.stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: "story", for: indexPath) as? StoryCollectionViewCell {
            let currentStory = storyModel.stories[indexPath.row]
            cell.setup(profile: currentStory.profileImage, username: currentStory.username, imageArr: currentStory.images)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feedModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = feedTableView.dequeueReusableCell(withIdentifier: "post", for: indexPath) as? PostTableViewCell {
            let currentPost = feedModel.posts[indexPath.row]
            cell.setup(image: currentPost.image, username: currentPost.username, likes: currentPost.likes, caption: currentPost.caption)
            return cell
        }
        return UITableViewCell()
    }
    
    
}

