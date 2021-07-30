//
//  Post.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation
import RealmSwift

class Post: Object, Codable, BaseModel {
    
    @objc dynamic var postID: String?
    @objc dynamic var id: String?
    @objc dynamic var slug: String?
    @objc dynamic var userID: String?
    @objc dynamic var postDescription: String?
    @objc dynamic var createdAt: String?
    @objc dynamic var groupID: String?
    @objc dynamic var profilePicture: String?
    @objc dynamic var name, corporateTag: String?
//    @objc dynamic var imageUrls: [String]?
    @objc dynamic var isCoach: Int = 0
    @objc dynamic var isTrainer: Int = 0

    enum CodingKeys: String, CodingKey {
        
        case postID = "post_id"
        case id, slug
        case userID = "user_id"
        case postDescription = "description"
        case createdAt = "created_at"
        case groupID = "group_id"
        case profilePicture = "profile_picture"
        case name
        case corporateTag = "corporate_tag"
//        case imageUrls = "image_urls"
        case isCoach = "is_coach"
        case isTrainer = "is_trainer"
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
