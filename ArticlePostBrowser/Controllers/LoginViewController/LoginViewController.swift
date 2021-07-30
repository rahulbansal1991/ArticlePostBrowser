//
//  LoginViewController.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 24/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    let loginViewModel : LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupData()
    }
    
    func setupData() {
        // Set Navigation title
        self.title = ScreenTitle.LOGIN.rawValue
        
        tfEmail.text = Constants.AUTHORISED_EMAIL_ID
        tfPassword.text = "test"
        
        btnLogin.curveRadius()
    }
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        
        if !checkForValidation() {
            // Don't proceed further if all validations not passed
            return
        }
        
        // Call Login Method
        loginViewModel.login(emailID: tfEmail.text!, password: tfPassword.text!) { (status, error, isNewUser) in
            
            if status {
                // Proceed to Home screen
                self.navigateToHomescreen(isNewUser: isNewUser)
                
            } else {
                
                if let actualError = error {
                    self.presentAlert(withTitle: actualError.domain, message: actualError.userInfo["errorMessage"] as! String)
                }
            }
        }
    }
    
    func checkForValidation() -> Bool {
                
        if tfEmail.isEmpty {
            
            presentAlert(withTitle: Alert.Title.ERROR.rawValue, message: Alert.Message.EMPTY_EMAIL.rawValue)
            
            return false
        }
        
        if tfPassword.isEmpty {
            
            presentAlert(withTitle: Alert.Title.ERROR.rawValue, message: Alert.Message.EMPTY_PASSWORD.rawValue)
            
            return false
        }
        
        if !tfEmail.isEmpty && !tfEmail.isValidEmail {
            
            presentAlert(withTitle: Alert.Title.ERROR.rawValue, message: Alert.Message.INVALID_EMAIL.rawValue)
            
            return false
        }
        
        return true
    }
    
    func navigateToHomescreen(isNewUser : Bool) {
        
        let homeVC = HomeViewController.instantiateViewController()
        homeVC.isNewUser = isNewUser
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func resetLoginFields() {
        tfEmail.text = ""
        tfPassword.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Reset Navigation title
        self.title = ""
        
        // Reset Login credentials
        resetLoginFields()
    }
}
