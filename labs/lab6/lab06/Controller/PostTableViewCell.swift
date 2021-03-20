//
//  PostTableViewCell.swift
//  lab05
//
//  Created by Shyam Kumar on 3/10/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 20
        // Initialization code
    }
    
    func setup(image: UIImage, username: String, likes: Int, caption: String) {
        profileImageView.image = image
        self.username.text = username
        postImage.image = image
        self.likes.text = "\(likes) likes"
        
        let attributes1: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .medium)]
        let attributes2: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .regular)]
        
        let attributedString1 = NSMutableAttributedString(string: "\(username) ", attributes: attributes1)
        let attributedString2 = NSMutableAttributedString(string: caption, attributes: attributes2)
        attributedString1.append(attributedString2)
        
        self.caption.attributedText = attributedString1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
