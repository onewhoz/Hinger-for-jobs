//
//  Cordinator.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/7/22.
//

import UIKit

class Coordinator {
    static var window : UIWindow!
    static let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    private static func transition(){
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.2
        
        UIView.transition(with: Coordinator.window, duration: duration, options: options, animations: {}, completion:
        { completed in
            // maybe do something on completion here
        })
    }
    static func changeViewControllerWithIdentifierNoTransition(_ identifier:String){
        
        let controller = storyboard.instantiateViewController(identifier: identifier)
        Coordinator.window.rootViewController = controller
     
        
    }
    static func changeViewControllerWithIdentifier(_ identifier:String){
        
        changeViewControllerWithIdentifierNoTransition(identifier)
     
        transition()
        
    }
//    static func changeTabBarController(_ identifier: String){
//        let controller = storyboard.navig
//    }
 

}
