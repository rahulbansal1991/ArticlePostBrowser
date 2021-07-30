//
//  SectionDetailViewController.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import UIKit

class SectionDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var model : CommonModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }

    class func instantiateViewController() -> SectionDetailViewController {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SectionDetailViewController") as! SectionDetailViewController
        return vc
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupData()
    }
    
    func setupData() {
        
        // Set Navigation title
        self.title = model.type.description
    }
    
    func configureTableView() {
        tableView.register(ContentTableViewCell.self)
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Reset Navigation title
        self.title = ""
    }
}

extension SectionDetailViewController : UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ContentTableViewCell
        cell.configure(model.data[indexPath.row], type: model.type)
        return cell
    }
}

extension SectionDetailViewController : UITableViewDelegate {
    
}
