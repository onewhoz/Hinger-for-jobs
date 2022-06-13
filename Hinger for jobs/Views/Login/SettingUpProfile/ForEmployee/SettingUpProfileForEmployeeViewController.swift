//
//  SettingUpProfileForEmployeeViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/6/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SettingUpProfileForEmployeeViewController: UIViewController {

    var occupancy, firstName, lastName : String?
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var occupancyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    
    func CleanFieldData(){
         occupancy = occupancyTextField.text!
         firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func UpdateAccountInfo(){
       
        let data = ["occupancy" : occupancy,
                    "first_name" : firstName,
                    "last_name" : lastName]
        Data.setDataForUser(data){
            self.UpdateLocalAccountInfo()
        }
        
        
    
        
        
    }
    
    func UpdateLocalAccountInfo(){
        
        UserInfo.occupancy = occupancy
        UserInfo.first_name = firstName
        UserInfo.last_name = lastName
        
        
    }
  
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        
        CleanFieldData()
        UpdateAccountInfo()
        Coordinator.changeViewControllerWithIdentifier("HomeEmployeeVC")
        
        
    }
    
}
