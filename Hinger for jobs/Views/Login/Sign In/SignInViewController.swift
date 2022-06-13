//
//  SignInViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/4/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    func login(){
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if err != nil{
                // Couldn't sign in
                self.errorLabel.text = err?.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                // Signed in succesfully
                Account.continueWhereLeft()
        
                
            }
        }
        
        
    }
    
 
    
    

    @IBAction func loginBtn(_ sender: Any) {
        login()
        
    }
    @IBAction func loginFacebookBtn(_ sender: Any) {
        print("Facebook")
    }
    @IBAction func loginGoogleBtn(_ sender: Any) {
        print("Google")
    }
    @IBAction func creatingAnAccountBtn(_ sender: Any) {
        print("Works")
        Coordinator.changeViewControllerWithIdentifier("SignUpVC")
    }
    @IBAction func forgotPswrdBtn(_ sender: Any) {
    }
    
}
