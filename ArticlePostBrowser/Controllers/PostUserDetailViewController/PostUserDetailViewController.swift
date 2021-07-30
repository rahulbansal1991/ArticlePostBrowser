//
//  PostUserDetailViewController.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import UIKit

class PostUserDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    class func instantiateViewController() -> PostUserDetailViewController {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostUserDetailViewController") as! PostUserDetailViewController
        return vc
    }
}
