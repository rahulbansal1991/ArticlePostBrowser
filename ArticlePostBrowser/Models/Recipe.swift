//
//  Recipe.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation
import RealmSwift

class Recipe: Object, Codable, BaseModel {
    @objc dynamic var title: String?
    @objc dynamic var cuisine: String?
    @objc dynamic var imageURL: String?
    @objc dynamic var recipeType: String?
    @objc dynamic var postID: String?
    @objc dynamic var id, slug: String?
    @objc dynamic var userID: String?
    @objc dynamic var recipeDescription: String?
    @objc dynamic var createdAt, groupID: String?
    @objc dynamic var profilePicture: String?
    @objc dynamic var name, corporateTag: String?
//    @objc dynamic var imageUrls: [String]?
    @objc dynamic var isCoach: Int = 0
    @objc dynamic var isTrainer: Int = 0

    enum CodingKeys: String, CodingKey {
        case title, cuisine
        case imageURL = "image_url"
        case recipeType = "recipe_type"
        case postID = "post_id"
        case id, slug
        case userID = "user_id"
        case recipeDescription = "description"
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
