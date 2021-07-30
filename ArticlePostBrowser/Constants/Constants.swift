//
//  Constants.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 24/06/21.
//

import Foundation

struct Constants {
    static let AUTHORISED_EMAIL_ID = "satish****o@gmail.com"
    static let API_URL = "http://bucket-community.s3.ap-south-1.amazonaws.com/sample.json"
}

enum ScreenTitle : String {
    case LOGIN = "Login"
    case HOME = "Home"
}

enum Alert {
    
    enum Title : String {
        case ERROR = "Error"
        case FAIL = "Fail"
    }
    
    enum Message : String {
        case EMPTY_EMAIL = "Email ID cannot be empty"
        case EMPTY_PASSWORD = "Password cannot be empty"
        case INVALID_EMAIL = "Invalid Email ID"
        case INVALID_LOGIN_CREDENTIALS = "Entered Email ID is incorrect. Please try again."
    }
}
