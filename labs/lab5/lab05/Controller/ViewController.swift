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
        
        //SET TABLE VIEW DELEGATE AND DATA SOURCE
        
        feedModel.createFeed()
        storyModel.createStories()
    }


}

// COLLECTION VIEW METHODS
extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // COUNT NUMBER OF ELEMENTS IN stories ARRAY IN STORYMODEL
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // DEQUEUE REUSABLE CELL WITH ID
        // CAST TO storyCollectionViewCell
        // CALL SETUP ON CELL
        // RETURN CELL
        
        return UICollectionViewCell()
    }
    
    
}

// TABLE VIEW METHODS
extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // COUNT NUMBER OF ELEMENTS IN posts ARRAY IN FEEDMODEL
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // DEQUEUE REUSABLE CELL WITH ID
        // CAST TO postTableViewCell
        // CALL SETUP ON CELL
        // RETURN CELL
        
        return UITableViewCell()
    }
    
    
}

