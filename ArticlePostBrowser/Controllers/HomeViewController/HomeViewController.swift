//
//  HomeViewController.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var homeViewModel = HomeViewModel()
    
    var isNewUser : Bool = false
    
    class func instantiateViewController() -> HomeViewController {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        
        // Fetch posts
        homeViewModel.fetchPosts(isNewUser: isNewUser) { (status) in
            
            if status {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupData()
    }
    
    func setupData() {
        
        // Set Navigation title
        self.title = ScreenTitle.HOME.rawValue
    }
    
    func configureTableView() {
        tableView.register(PeopleTableViewCell.self)
        tableView.register(ContentTableViewCell.self)
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "ContentTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "ContentTableViewHeader")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func navigateToSectionDetailScreen(model : CommonModel) {
        
        let sectionDetailVC = SectionDetailViewController.instantiateViewController()
        sectionDetailVC.model = model
        self.navigationController?.pushViewController(sectionDetailVC, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Reset Navigation title
        self.title = ""
    }
}

extension HomeViewController : UITableViewDataSource {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeViewModel.datasource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return homeViewModel.datasource[section].type == PostType.User ? 1 : homeViewModel.datasource[section].data.count > 2 ? 2 : homeViewModel.datasource[section].data.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ContentTableViewHeader") as! ContentTableViewHeader
        headerView.delegate = self
        
        headerView.config(postType: homeViewModel.datasource[section].type)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return homeViewModel.datasource[indexPath.section].type == PostType.User ? 170 : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = homeViewModel.datasource[indexPath.section]
        
        if model.type == PostType.User {
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as PeopleTableViewCell
            cell.configure(model)
            cell.layer.masksToBounds = true
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ContentTableViewCell
            cell.configure(model.data[indexPath.row], type : model.type)
            cell.layer.masksToBounds = true
            return cell
        }        
    }
}

extension HomeViewController : UITableViewDelegate {
    
}

extension HomeViewController : ContentTableViewHeaderDelegate {
    
    func seeAllButtonTapped(postType : PostType) {
        
        if let model = homeViewModel.getModelOfPostType(postType: postType) {
         
            navigateToSectionDetailScreen(model: model)
        }
    }
}
