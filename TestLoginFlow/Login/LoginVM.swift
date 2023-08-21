//
//  LoginVM.swift
//  TestLoginFlow
//
//  Created by user on 09/01/23.
//



class LoginVM {
    
    var user:User?
    let networkManager = NetworkManager()  // can be created singlton
    
    func login(email:String, password:String, completionHandler: @escaping ((String,Bool)) -> Void)
    {
        let validation = validateInput(email: email, password:password)
        if validation.1 == false
        {
            completionHandler(validation)
        }
        
        networkManager.loginUser {[weak self] userResponse, errorMessage in
            if let errorMessage = errorMessage
            {
                completionHandler((errorMessage,false))
            }
            else if let userResponse = userResponse
            {
                self?.user = userResponse.user
                completionHandler(("Hello \(userResponse.user.firstName)",true))
            }
        }
    }
    
    
    private func validateInput(email:String, password:String) -> (String,Bool)
    {
        if email.isEmpty || password.isEmpty
        {
            return ("email and password can not be empty",false)
        }
        
        let validator = InputValidator()
        
        let emailStatus = validator.isValidEmail(email)
        if emailStatus == false
        {
            return ("Invalid email",false)
        }
        else
        {
            return validator.isPasswordValid(password)
        }
    }

}
