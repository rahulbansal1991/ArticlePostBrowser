//
//  ContentTableViewCell.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet weak var imgvPost: UIImageView!
    @IBOutlet weak var lblPostTitle: UILabel!
    @IBOutlet weak var lblPostDescription: UILabel!
    
    let placeholderImage : UIImage = UIImage(named: "placeholder_image")!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgvPost.round()
    }

    func configure(_ model : BaseModel, type : PostType) {
        
        switch type {
        case .Post:
            if let postModel = model as? Post {
                imgvPost.imageFromServerURL(postModel.profilePicture ?? "", placeHolder: placeholderImage)
                lblPostTitle.text = postModel.name
                lblPostDescription.text = postModel.postDescription
            }
        case .Recipe:
            if let recipeModel = model as? Recipe {
                imgvPost.imageFromServerURL(recipeModel.profilePicture ?? "", placeHolder: placeholderImage)
                lblPostTitle.text = recipeModel.title
                lblPostDescription.text = recipeModel.cuisine
            }
        case .Article:
            if let articleModel = model as? Article {
                imgvPost.imageFromServerURL(articleModel.profilePicture ?? "", placeHolder: placeholderImage)
                lblPostTitle.text = articleModel.title
                lblPostDescription.text = articleModel.category
            }
        case .Exercise:
            if let exerciseModel = model as? Exercise {
                imgvPost.imageFromServerURL(exerciseModel.thumbnailURL ?? "", placeHolder: placeholderImage)
                lblPostTitle.text = exerciseModel.name
                lblPostDescription.text = exerciseModel.preparation
            }
        case .Food:
            if let foodModel = model as? Food {
                imgvPost.imageFromServerURL(foodModel.imageURL ?? "", placeHolder: placeholderImage)
                lblPostTitle.text = foodModel.name
                lblPostDescription.text = foodModel.category
            }
        case .User:
            if let userModel = model as? User {
                imgvPost.imageFromServerURL(userModel.profilePicture ?? "", placeHolder: placeholderImage)
                lblPostTitle.text = userModel.name
                lblPostDescription.text = userModel.country                
            }
        }
    }
}
