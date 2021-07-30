//
//  NibLoadableView.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation
import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: NibLoadableView { }
extension UICollectionViewCell: NibLoadableView { }
