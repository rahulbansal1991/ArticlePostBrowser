//
//  HomeViewModel.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation

typealias CompletionHandler = (_ success:Bool) -> Void

class HomeViewModel {
    
    private var arrPeople : [User]!
    private var arrPosts : [Post]!
    private var arrReceipe : [Recipe]!
    private var arrArticle : [Article]!
    private var arrExercise : [Exercise]!
    private var arrFood : [Food]!
    
    var datasource = [CommonModel]()
    
    func fetchPosts(isNewUser : Bool, completion : @escaping CompletionHandler) {
            
        if !isNewUser {
            // Do not call the API and fetch data from Local DB
            // Fetch data from Local Database and return to ViewController
            self.fetchDataFromLocalDB()

            // Update datasource
            self.updateDatasource()
            
            return
        }
        
        let apiService = APIService()
        
        apiService.fetchData { (status, arrUsers, arrPosts, arrReceipe, arrArticle, arrExercise, arrFood, error) in
            
            if status {
                // Success
                // Save Data into Local Database
                if let users = arrUsers {
                    DatabaseRepository.shared.saveUsers(users)
                }
                
                if let posts = arrPosts {
                    DatabaseRepository.shared.savePosts(posts)
                }
                
                if let receipes = arrReceipe {
                    DatabaseRepository.shared.saveRecipe(receipes)
                }
                
                if let articles = arrArticle {
                    DatabaseRepository.shared.saveArticle(articles)
                }
                
                if let exercise = arrExercise {
                    DatabaseRepository.shared.saveExercise(exercise)
                }
                
                if let foods = arrFood {
                    DatabaseRepository.shared.saveFood(foods)
                }
            }
            
            // Fetch data from Local Database and return to ViewController
            self.fetchDataFromLocalDB()

            // Update datasource
            self.updateDatasource()
                        
            completion(true)
        }
    }
    
    func fetchDataFromLocalDB() {
        
        self.arrPeople = DatabaseRepository.shared.getUsers()
        self.arrPosts = DatabaseRepository.shared.getPosts()
        self.arrReceipe = DatabaseRepository.shared.getRecipe()
        self.arrArticle = DatabaseRepository.shared.getArticle()
        self.arrExercise = DatabaseRepository.shared.getExercise()
        self.arrFood = DatabaseRepository.shared.getFood()
    }
    
    func updateDatasource() {
        
        let user = CommonModel()
        user.type = PostType.User
        user.data = self.arrPeople

        self.datasource.append(user)
        
        let post = CommonModel()
        post.type = PostType.Post
        post.data = self.arrPosts
        
        self.datasource.append(post)
        
        let recipe = CommonModel()
        recipe.type = PostType.Recipe
        recipe.data = self.arrReceipe
        
        self.datasource.append(recipe)
        
        let article = CommonModel()
        article.type = PostType.Article
        article.data = self.arrArticle
        
        self.datasource.append(article)
        
        let exercise = CommonModel()
        exercise.type = PostType.Exercise
        exercise.data = self.arrExercise
        
        self.datasource.append(exercise)
        
        let food = CommonModel()
        food.type = PostType.Food
        food.data = self.arrFood
        
        self.datasource.append(food)
    }
    
    func getModelOfPostType(postType : PostType) -> CommonModel? {
        
        return datasource.filter { $0.type == postType }.first
    }
}
