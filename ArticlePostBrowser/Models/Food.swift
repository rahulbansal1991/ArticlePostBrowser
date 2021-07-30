//
//  Food.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation
import RealmSwift

class Food: Object, Codable, BaseModel {
    @objc dynamic var id, category, carbs, calories: String?
    @objc dynamic var protein, fats, fiber, name: String?
    @objc dynamic var restaurant, alcohol: String?
    @objc dynamic var proteinRatio, foodType, quantity, oldQuantity: String?
    @objc dynamic var unit, show, isReplaceable: String?
    @objc dynamic var imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, category, carbs, calories, protein, fats, fiber, name, restaurant, alcohol
        case proteinRatio = "protein_ratio"
        case foodType = "food_type"
        case quantity
        case oldQuantity = "old_quantity"
        case unit, show
        case isReplaceable = "is_replaceable"
        case imageURL = "image_url"
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
