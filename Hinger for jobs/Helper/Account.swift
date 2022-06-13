//
//  Account.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/8/22.
//

import Foundation
import FirebaseAuth

class Account {
    static func logOut(){
        do{
                    try FirebaseAuth.Auth.auth().signOut()
            
                }
                catch{
                    print("Error has occured")
                }
        
        Coordinator.changeViewControllerWithIdentifier("LoginVC")
    }
    
    
    static func continueWhereLeft(){
        Data.fetchUser {
            if UserInfo.account_type == nil{
                Coordinator.changeViewControllerWithIdentifier("CreatingAnAccountVC")
            }
            
            else if UserInfo.first_name == nil{
                if UserInfo.account_type == "employee"{
                    Coordinator.changeViewControllerWithIdentifier("SettingUpProfileForEmployeeVC")
    
                }
                else {
                    Coordinator.changeViewControllerWithIdentifier("SettingUpProfileForEmployerVC")
                }
            }
            else{
                if UserInfo.account_type == "employee"{
                    Coordinator.changeViewControllerWithIdentifier("HomeEmployeeVC")
    
                }
                else {
//                    Coordinator.changeViewControllerWithIdentifier("HomeEmployerVC")
                    Coordinator.changeViewControllerWithIdentifier("HomeEmployerTBC")
                }
            }
       
        }


    }
}
