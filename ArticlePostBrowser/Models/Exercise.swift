//
//  Exercise.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation
import RealmSwift

class Exercise: Object, Codable, BaseModel {
    
    @objc dynamic var id, name, bodyPartID: String?
    @objc dynamic var thumbnailURL: String?
    @objc dynamic var url: String?
    @objc dynamic var preparation: String?
//    @objc dynamic var execution: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case bodyPartID = "body_part_id"
        case thumbnailURL = "thumbnail_url"
        case url, preparation
//        case execution
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
