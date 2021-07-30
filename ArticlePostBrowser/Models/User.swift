//
//  User.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation
import RealmSwift

class User: Object, Codable, BaseModel {
    @objc dynamic var username: String?
    @objc dynamic var userID: String?
    @objc dynamic var bio: String?
    @objc dynamic var profilePicture: String?
    @objc dynamic var name: String
    @objc dynamic var city: String?
    @objc dynamic var state: String?
    @objc dynamic var country: String?
    @objc dynamic var status: String?
    @objc dynamic var corporateTag: String?
    @objc dynamic var isCoach: Int = 0
    @objc dynamic var isTrainer: Int = 0
    @objc dynamic var countryObj: CountryObj?

    enum CodingKeys: String, CodingKey {
        case username
        case userID = "user_id"
        case bio
        case profilePicture = "profile_picture"
        case name, city, state, country, status
        case corporateTag = "corporate_tag"
        case isCoach = "is_coach"
        case isTrainer = "is_trainer"
        case countryObj = "country_obj"
    }
    
    override static func primaryKey() -> String? {
        return "userID"
    }
}

// MARK: - CountryObj
class CountryObj: Object, Codable {
    @objc dynamic var id: String?
    @objc dynamic var name: String?
    @objc dynamic var dialCode: String?
    @objc dynamic var currencyCode: String?
    @objc dynamic var currencySymbol: String?
    @objc dynamic var code: String?
    @objc dynamic var flag: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case dialCode = "dial_code"
        case currencyCode = "currency_code"
        case currencySymbol = "currency_symbol"
        case code, flag
    }
}
