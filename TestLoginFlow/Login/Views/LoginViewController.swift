//
//  LoginViewController.swift
//  TestLoginFlow
//
//  Created by Moreyeahs on 09/01/23.
//

import UIKit

class LoginViewController: UIViewController {

  let viewModel = LoginVM() // ViewModel can be passed from outside
    
  @IBOutlet weak var txtUsername: UITextField!
  @IBOutlet weak var txtPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  @IBAction func btnLoginAction(_ sender: Any) {
      viewModel.login(email:txtUsername.text ?? "", password:txtPassword.text ?? "") {[weak self] (message, status) in
          
          let alert = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
              
          }))
          
          DispatchQueue.main.async {
              self?.present(alert, animated: false, completion: nil)
          }
      }
  }

}
