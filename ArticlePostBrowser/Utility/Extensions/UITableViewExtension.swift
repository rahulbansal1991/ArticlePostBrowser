//
//  UITableViewExtension.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    func removeEmptyRows () {
        self.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    func showNoDataView() -> Void {
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        noDataLabel.text          = "No data available"
        noDataLabel.font          = UIFont.systemFont(ofSize: 14)
        noDataLabel.textColor     = UIColor.lightGray
        noDataLabel.textAlignment = .center
        self.backgroundView  = noDataLabel
    }
    
    func removeNoDataView() -> Void {
        self.backgroundView = nil
    }
}
