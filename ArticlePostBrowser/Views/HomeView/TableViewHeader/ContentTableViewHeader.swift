//
//  ContentTableViewHeader.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import UIKit

protocol ContentTableViewHeaderDelegate {
    func seeAllButtonTapped(postType : PostType)
}

class ContentTableViewHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
    
    var postType : PostType!
    
    var delegate : ContentTableViewHeaderDelegate?
    
    @IBAction func didTapOnSeeAllButton(_ sender: UIButton) {
        
        delegate?.seeAllButtonTapped(postType: postType)
    }
    
    func config(postType : PostType) {
        
        self.postType = postType
        
        lblTitle.text = postType.description
    }
    
    
}
