//
//  UIViewExtension.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 24/06/21.
//

import UIKit

extension UIView {
    
    func round() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = true
    }
    
    func curveRadius() {
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
    
}
