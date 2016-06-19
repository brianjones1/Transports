//
//  ViewControllerGoogle.swift
//  Transports
//
//  Created by Romain Rabouan on 07/05/16.
//  Copyright © 2016 RomainRabouan. All rights reserved.
//



// IMPORTANT: IN DEVELOPMENT
import UIKit

class ViewControllerGoogle: UIViewController, GIDSignInUIDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.presentViewController(viewController, animated: true, completion: nil)
        print("Sign in presented")
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        print("Sign in dismissed")
    }
}
