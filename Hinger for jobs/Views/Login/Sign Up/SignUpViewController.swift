//
//  SignUpViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/4/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordFieldOne: UITextField!
    @IBOutlet weak var passwordFieldTwo: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    // Check the fields and validate that the data is correct. If correct -> nil, otherwise return error message
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordFieldOne.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordFieldTwo.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        else if passwordFieldOne.text != passwordFieldTwo.text{
            return "Passwords don't match"
        }
        let cleanedPassword = passwordFieldOne.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false{
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters long, contains at least one big letter and a digit"
        }
        else if Utilities.isValidEmail(cleanedEmail) == false {
            return "Please make sure your email has been typed correctly"
        }
       
        return nil
    }
    
    func createAccount(){
        
        let error = validateFields()
        
        if error != nil{
            showError(error!)
        }
        else {
            // Clean all data
            
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordFieldOne.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            // Create a user
            Auth.auth().createUser(withEmail: email, password: password) { result, err in
                // Check for errors
                if err != nil {
                    // There was an error creating the user
                    self.showError("Error creating a user")
                }
                else {
                    Data.setDataForUser(["date_of_registration": "2022", "email" : email]){
                        Coordinator.changeViewControllerWithIdentifier("CreatingAnAccountVC")
                        
                    }
                    
                
                   
                }
            }
          
        }
        
        
    }
    
   
    
    func showError(_ message : String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
    @IBAction func createBtn(_ sender: Any) {
        createAccount()
    }
    
    @IBAction func signUpFacebookBtn(_ sender: Any) {
    }
    @IBAction func signUpGoogleBtn(_ sender: Any) {
    }
    @IBAction func signInBtn(_ sender: Any) {
        
        Coordinator.changeViewControllerWithIdentifier("SignInVC")
        
    }
}
