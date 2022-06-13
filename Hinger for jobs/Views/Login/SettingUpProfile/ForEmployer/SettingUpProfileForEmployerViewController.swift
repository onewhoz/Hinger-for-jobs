//
//  SettingUpProfileForEmployerViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/6/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
class SettingUpProfileForEmployerViewController: UIViewController {

    @IBOutlet weak var companyNameTextField: UITextField!
    
    @IBOutlet weak var industryTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var positionTextField: UITextField!
    
    var companyName, industry, firstName, lastName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
  
    
    func CleanFieldData(){
         companyName = companyNameTextField.text!
         industry = industryTextField.text!
         firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    func UpdateAccountInfo(){
       
        let data = ["company_name" : companyName,
                    "industry": industry,
                    "first_name" : firstName,
                    "last_name" : lastName]
        Data.setDataForUser(data){
            self.UpdateLocalAccountInfo()
        }
        
        
    
        
        
    }
    
    func UpdateLocalAccountInfo(){
        
        UserInfo.company_name = companyName
        UserInfo.industry = industry
        UserInfo.first_name = firstName
        UserInfo.last_name = lastName
        
        
    }
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        
        CleanFieldData()
        UpdateAccountInfo()
        Coordinator.changeViewControllerWithIdentifier("HomeEmployerTBC")
        
        

    
        
        
    }


}
