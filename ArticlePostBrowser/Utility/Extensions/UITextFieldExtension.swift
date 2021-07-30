//
//  UITextFieldExtension.swift
//  ArticlePostBrowser
//
//  Created by Rahul Bansal on 24/06/21.
//

import Foundation
import UIKit

extension UITextField {
    
    var isEmpty: Bool {
        
        if let text = self.text, !text.isEmpty, text.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            return false
        }
        return true
    }
    
    var isValidEmail : Bool {
        
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive)
        return regex.firstMatch(in: self.text!, options: [], range: NSRange(location: 0, length: self.text!.count)) != nil
    }

    
}
