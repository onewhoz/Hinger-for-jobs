//
//  Data.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/7/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class Data {
    
    private static var userID = Auth.auth().currentUser?.uid
    // guard let userID = Auth.auth().currentUser?.uid else { return }
    
    static func setDataForUser(_ data : [String : Any], completionHandler: (() -> Void)!){
        Firestore.firestore().collection("users").document(userID!).setData(data, merge: true)
        completionHandler()
        
    }
    static func fetchUser(completionHandler: (() -> Void)!){ // Fetach user
        Firestore.firestore().collection("users").document(userID!).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
//            guard let data = snapshot?.data() else {
//                print(snapshot?.data().debugDescription.localizedLowercase)
//                return
//            }
            let data = snapshot?.data()
           
            let account_type = data?["account_type"] as? String
            let first_name = data?["first_name"] as? String
      
            UserInfo.account_type = account_type
            UserInfo.first_name = first_name
            
          
            
            completionHandler()
        }
        
    }
    
    
    
}
