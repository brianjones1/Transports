//
//  LoginViewController.swift
//  Transports
//
//  Created by Romain Rabouan on 06/04/16.
//  Copyright © 2016 RomainRabouan. All rights reserved.
//


// IMPORTANT: IN DEVELOPMENT


import UIKit
import LocalAuthentication

class LoginViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        self.statusLabel.hidden = true
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
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

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil && CURRENT_USER.authData != nil {
            self.logoutButton.hidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func loginAction(sender: UIButton) {
        let email = self.emailTextField.text
        let password = self.passwordTextField.text
        
        if email != "" && password != "" {
            FIREBASE_REF.authUser(email, password: password, withCompletionBlock: { (error, authData) -> Void in
                if error == nil {
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                    print("Logged in :)")
                    self.statusLabel.text! = "Vous êtes connecté, \(email!)"
                    self.statusLabel.hidden = false
                    let alert = UIAlertController(title: "Connecté", message: "Vous êtes maintenant connecté, \(email!)", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alert.addAction(action)
                    self.presentViewController(alert, animated: true, completion: nil)
                    self.logoutButton.hidden = false
                    
                } else {
                    // Si il y a une erreur, elle est ici ^^
                    let alert = UIAlertController(title: "Erreur", message: error.localizedDescription, preferredStyle: .Alert)
                    
                    self.statusLabel.hidden = true
                    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alert.addAction(action)
                    self.presentViewController(alert, animated: true, completion: nil)
                    print(error)
                }
            })
        } else {
            let alert = UIAlertController(title: "Erreur", message: "Entrez votre email et votre mot de passe", preferredStyle: .Alert)
            self.statusLabel.hidden = true
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }

    @IBAction func logoutAction(sender: UIButton) {
        CURRENT_USER.unauth()
        
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        self.logoutButton.hidden = true
        self.statusLabel.hidden = true
    }
    @IBAction func touchID(sender: AnyObject) {
        
    }
    
    
    
    

}
