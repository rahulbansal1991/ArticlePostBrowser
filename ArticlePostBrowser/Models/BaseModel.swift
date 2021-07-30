//
//  BaseModel.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation

enum PostType {
    case User
    case Post
    case Recipe
    case Article
    case Exercise
    case Food
    
    var description : String {
        switch self {
        case .User: return "People";
        case .Post: return "Post";
        case .Recipe: return "Recipe";
        case .Article: return "Article";
        case .Exercise: return "Exercise";
        case .Food: return "Food";
        }
    }
}

protocol BaseModel {
    
}

class CommonModel {
    
    var type : PostType!
    var data : [BaseModel]!
}
