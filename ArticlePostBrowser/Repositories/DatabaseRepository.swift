//
//  DatabaseRepository.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation
import RealmSwift

class DatabaseRepository {
    
    public static var shared : DatabaseRepository = {
        return DatabaseRepository()
    }()
    
    private var realm: Realm!
    
    func configure() {
        
        let dictionary = Bundle.main.infoDictionary!
        let concatedText = "\(dictionary["CFBundleShortVersionString"] as! String)"
        let updatedText = concatedText.replacingOccurrences(of: ".", with: "", options: NSString.CompareOptions.literal, range: nil)
        var currentSchemaVersion: UInt64 = 1
        currentSchemaVersion = UInt64(updatedText)!
        
        // Realm database migration code.
        var config = Realm.Configuration(
            schemaVersion: currentSchemaVersion,
            migrationBlock: { migration, oldSchemaVersion in
        })
        
        config.deleteRealmIfMigrationNeeded = true
        
        Realm.Configuration.defaultConfiguration = config
        print("Database file path:  \(String(describing: config.fileURL))")
        
        realm = try! Realm()
    }
    
    func getUsers() -> [User] {
        return Array(realm.objects(User.self))
    }
    
    func getPosts() -> [Post] {
        return Array(realm.objects(Post.self))
    }
    
    func getRecipe() -> [Recipe] {
        return Array(realm.objects(Recipe.self))
    }
    
    func getArticle() -> [Article] {
        return Array(realm.objects(Article.self))
    }
    
    func getExercise() -> [Exercise] {
        return Array(realm.objects(Exercise.self))
    }
    
    func getFood() -> [Food] {
        return Array(realm.objects(Food.self))
    }
    
    func saveUsers(_ data : [User]) {
        
        deleteUsers()
        
        try! realm.write {
            for value in data {
                realm.add(value, update: Realm.UpdatePolicy.all)
            }
        }
    }
    
    func savePosts(_ data : [Post]) {
        
        deletePosts()
        
        try! realm.write {
            for value in data {
                realm.add(value, update: Realm.UpdatePolicy.all)
            }
        }
    }
    
    func saveRecipe(_ data : [Recipe]) {
        
        deleteRecipe()
        
        try! realm.write {
            for value in data {
                realm.add(value, update: Realm.UpdatePolicy.all)
            }
        }
    }
    
    func saveArticle(_ data : [Article]) {
        
        deleteArticle()
        
        try! realm.write {
            for value in data {
                realm.add(value, update: Realm.UpdatePolicy.all)
            }
        }
    }
    
    func saveExercise(_ data : [Exercise]) {
        
        deleteExercise()
        
        try! realm.write {
            for value in data {
                realm.add(value, update: Realm.UpdatePolicy.all)
            }
        }
    }
    
    func saveFood(_ data : [Food]) {
        
        deleteFood()
        
        try! realm.write {
            for value in data {
                realm.add(value, update: Realm.UpdatePolicy.all)
            }
        }
    }
    
    func deleteUsers() {
        let data = getUsers()
        try! realm.write {
            realm.delete(data)
        }
    }
    
    func deletePosts() {
        let data = getPosts()
        try! realm.write {
            realm.delete(data)
        }
    }
    
    func deleteRecipe() {
        let data = getRecipe()
        try! realm.write {
            realm.delete(data)
        }
    }
    
    func deleteArticle() {
        let data = getArticle()
        try! realm.write {
            realm.delete(data)
        }
    }
    
    func deleteExercise() {
        let data = getExercise()
        try! realm.write {
            realm.delete(data)
        }
    }
    
    func deleteFood() {
        let data = getFood()
        try! realm.write {
            realm.delete(data)
        }
    }
    
    func getLoggedInUser() -> [LoggedInUser] {
        return Array(realm.objects(LoggedInUser.self))
    }
    
    func saveLoggedInUser(_ data : LoggedInUser) {
                
        try! realm.write {
            realm.add(data, update: Realm.UpdatePolicy.all)
        }
    }
}
