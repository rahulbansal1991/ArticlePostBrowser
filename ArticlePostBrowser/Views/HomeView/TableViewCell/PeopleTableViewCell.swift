//
//  PeopleTableViewCell.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let collectionViewCellReuseIdentifier = "PeopleCollectionViewCell"

    var model : CommonModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureCollectionView()
    }
    
    func configure(_ data : CommonModel) {
        self.model = data
        
        collectionView.reloadData()
    }
    
    func configureCollectionView() {
        collectionView.register(UINib(nibName: "PeopleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectionViewCellReuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension PeopleTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.data.count > 10 ? 10 : model.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellReuseIdentifier, for: indexPath) as! PeopleCollectionViewCell
        
        if let userModel = model.data[indexPath.row] as? User {
            cell.config(title: userModel.name, detailText: userModel.country ?? "", imageURL: userModel.profilePicture ?? "")
        }
        
        return cell
    }
}
