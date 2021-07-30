//
//  LoginViewModel.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 25/06/21.
//

import Foundation

class LoginViewModel {
    
    func login(emailID: String, password: String, completion: @escaping ((_ result: Bool, _ error : NSError?, _ isNewUser : Bool) -> Void)) {
                
        if isNewUser(emailID: emailID) {
            // Save user in Local DB
            let loginUser = LoggedInUser()
            loginUser.emailID = emailID
            
            DatabaseRepository.shared.saveLoggedInUser(loginUser)
            
            completion(true, nil, true)
            
        } else {
            completion(true, nil, false)
        }
        
        
        
        // As we are logging in with static email ID
//        if validateLogin(emailID: emailID) {
//            completion(true, nil)
//        } else {
//
//            let error = NSError.init(domain: Alert.Title.FAIL.rawValue, code: 200, userInfo: ["errorMessage": Alert.Message.INVALID_LOGIN_CREDENTIALS.rawValue])
//            completion(false, error)
//        }
    }
    
    func validateLogin(emailID : String) -> Bool {
        
        return emailID == Constants.AUTHORISED_EMAIL_ID ? true : false
    }
    
    func isNewUser(emailID: String) -> Bool {
        
        // Is user already exists in Local DB
        let loggedInUsers = DatabaseRepository.shared.getLoggedInUser()
        
        return loggedInUsers.filter { $0.emailID == emailID }.count == 0
    }
}
