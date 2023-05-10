//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    let alert = UIAlertController.init(title: "Authentication failed", message: "Computer says no.", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        #if targetEnvironment(simulator)
            emailTextfield.text = "nico@example.com"
            passwordTextfield.text = "defaultpw"
        #endif
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text, !email.isEmpty && !password.isEmpty {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if error != nil {
                    self.alert.message = error?.localizedDescription
                    self.present(self.alert, animated: true)
                }
                
                self.performSegue(withIdentifier: Constants.Segues.login, sender: self)
            }
        }
    }


}
