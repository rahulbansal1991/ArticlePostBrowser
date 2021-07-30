//
//  PeopleCollectionViewCell.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgvUser: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    
    let placeholderImage : UIImage = UIImage(named: "placeholder_image")!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewBackground.layer.borderWidth = 1
        viewBackground.layer.borderColor = UIColor.lightGray.cgColor
        viewBackground.layer.cornerRadius = 4
    }
    
    func config(title : String, detailText : String, imageURL : String) {
        imgvUser.imageFromServerURL(imageURL, placeHolder: placeholderImage)
        lblTitle.text = title
        lblDetail.text = detailText
    }

}
