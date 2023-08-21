//
//  InputValidator.swift
//  TestLoginFlow
//
//  Created by user on 09/01/23.
//

import Foundation


class InputValidator {

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isPasswordValid(_ password:String) -> (String,Bool)
    {
        let count = password.count
        if count > 10
        {
            return ("Password lenth should not be more than 10 Character",false)
        }
        else if count < 6
        {
            return ("Password lenth should not be less than 6 Character",false)
        }
        else
        {
            return ("Success",true)
        }
    }
}
