//
//  RecentLoggedInUsers.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation
import RealmSwift

class LoggedInUser : Object {
    
    @objc dynamic var emailID : String!
    
    override static func primaryKey() -> String? {
        return "emailID"
    }
}
