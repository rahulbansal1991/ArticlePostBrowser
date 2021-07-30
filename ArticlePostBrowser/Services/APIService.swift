//
//  APIService.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation
import Alamofire

protocol APIServiceProtocol {
    func fetchData( complete: @escaping ( _ success: Bool, _ users : [User]?, _ posts : [Post]?, _ recipe : [Recipe]?, _ article : [Article]?, _ exercise : [Exercise]?, _ food : [Food]?, _ error: Error? )->() )
}

class UrlComponents {
    
    let baseUrlString = Constants.API_URL
    
    var url: URL {
        guard let composedUrl = URL(string: baseUrlString) else {
            fatalError("Unable to build request url")
        }
        
        return composedUrl
    }
}

private let sessionManager: URLSession = {
    let urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default
    return URLSession(configuration: urlSessionConfiguration, delegate: nil, delegateQueue: nil)
}()

class APIService: APIServiceProtocol {
    
    func fetchData( complete: @escaping ( _ success: Bool, _ users : [User]?, _ posts : [Post]?, _ recipe : [Recipe]?, _ article : [Article]?, _ exercise : [Exercise]?, _ food : [Food]?, _ error: Error? )->() ) {
        
        AF.request(Constants.API_URL, method: .get,  parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                switch response.result {
                
                case .success(let value):
                    
                    guard let json = value as? [String: Any] else {
                        return
                    }
                    
                    guard let result = json["result"] as? [String: Any] else {
                        return
                    }
                        
                    guard let data = result["data"] as? [String: Any] else {
                        return
                    }
                    
                    var arrUsers = [User]()
                    
                    // Parse User Model
                    if let users = data["users"] as? [String: Any] {
                        
                        if let list = users["list"] {
                            
                            if let jsonData = try? JSONSerialization.data(withJSONObject:list) {
                                do {
                                    let decoder = JSONDecoder()
                                    let response = try decoder.decode([User].self, from: jsonData)
                                    arrUsers = response
                                } catch {
                                    
                                }
                            }
                        }
                    }
                    
                    // Posts
                    guard let posts = data["posts"] as? [[String : Any]] else {
                        return
                    }
                    
                    var arrPosts = [Post]()
                    var arrRecipe = [Recipe]()
                    var arrArticle = [Article]()
                    var arrExercise = [Exercise]()
                    var arrFood = [Food]()
                    
                    for post in posts {
                        
                        if post["key"] as! String == "posts" {
                            if let jsonData = try? JSONSerialization.data(withJSONObject:post["list"] as Any) {
                                do {
                                    let decoder = JSONDecoder()
                                    let response = try decoder.decode([Post].self, from: jsonData)
                                    arrPosts = response
                                } catch {
                                    
                                }
                            }
                        } else if post["key"] as! String == "recipe" {
                            if let jsonData = try? JSONSerialization.data(withJSONObject:post["list"] as Any) {
                                do {
                                    let decoder = JSONDecoder()
                                    let response = try decoder.decode([Recipe].self, from: jsonData)
                                    arrRecipe = response
                                } catch {
                                    
                                }
                            }
                        } else if post["key"] as! String == "article" {
                            if let jsonData = try? JSONSerialization.data(withJSONObject:post["list"] as Any) {
                                do {
                                    let decoder = JSONDecoder()
                                    let response = try decoder.decode([Article].self, from: jsonData)
                                    arrArticle = response
                                } catch {
                                    
                                }
                            }
                        } else if post["key"] as! String == "exercise" {
                            if let jsonData = try? JSONSerialization.data(withJSONObject:post["list"] as Any) {
                                do {
                                    let decoder = JSONDecoder()
                                    let response = try decoder.decode([Exercise].self, from: jsonData)
                                    arrExercise = response
                                } catch {
                                    
                                }
                            }
                        } else if post["key"] as! String == "food" {
                            if let jsonData = try? JSONSerialization.data(withJSONObject:post["list"] as Any) {
                                do {
                                    let decoder = JSONDecoder()
                                    let response = try decoder.decode([Food].self, from: jsonData)
                                    arrFood = response
                                } catch {
                                    
                                }
                            }
                        }
                    }
                    
                    complete(true, arrUsers, arrPosts, arrRecipe, arrArticle, arrExercise, arrFood, nil)
                    
                case .failure(let error):
                    print(error)
                    complete(false, nil, nil, nil, nil, nil, nil, error)
                }
            }
    }
}










