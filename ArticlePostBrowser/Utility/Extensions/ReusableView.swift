//
//  ReusableView.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation
import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: ReusableView { }
extension UICollectionViewCell: ReusableView { }
