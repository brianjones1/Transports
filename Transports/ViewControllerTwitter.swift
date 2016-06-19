//
//  ViewControllerTwitter.swift
//  Transports
//
//  Created by Romain Rabouan on 07/05/16.
//  Copyright © 2016 RomainRabouan. All rights reserved.
//

import UIKit

class ViewControllerTwitter: UIViewController {
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var twitterUsernameLabel: UILabel!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        FIREBASE_REF_TWITTER.observeAuthEventWithBlock { (authDataTwitter) in
            if authDataTwitter != nil {
                let twitterUserName = authDataTwitter.providerData["username"] as? String
                self.twitterUsernameLabel.text! = "Connecté avec l'identifiant \"@\(twitterUserName!)\""
                self.logoutButton.hidden = false
            } else {
                self.twitterUsernameLabel.text! = ""
                self.logoutButton.hidden = true
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func twitterAction(sender: AnyObject) {
        TWITTER_AUTH_HELPER.selectTwitterAccountWithCallback { (errorTwitter, accountsTwitter) in
            if errorTwitter != nil {
                let alert = UIAlertController(title: "Erreur", message: errorTwitter.localizedDescription, preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(action)
                self.presentViewController(alert, animated: true, completion: nil)
            } else if accountsTwitter.count == 1 {
                let accountTwitter = accountsTwitter[0] as? ACAccount
                self.activityIndicator.startAnimating()
                
        TWITTER_AUTH_HELPER.authenticateAccount(accountTwitter, withCallback: { (errorTwitter, authDataTwitter) in
            self.activityIndicator.stopAnimating()
            if errorTwitter != nil {
                let alert = UIAlertController(title: "Erreur", message: errorTwitter.localizedDescription, preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            } else {
                NSUserDefaults.standardUserDefaults().setValue(authDataTwitter.uid, forKey: "uid")
                print("Connecté")
            }
        })
            } else if accountsTwitter.count > 1 {
                let actionSheetController = UIAlertController(title: "Comptes", message: "Sélectionnez un compte Twitter parmi ceux de la liste ci-dessous", preferredStyle: .ActionSheet)
                let cancelAction = UIAlertAction(title: "Annuler", style: .Cancel, handler: nil)
                actionSheetController.addAction(cancelAction)
                
                for accountTwitter in accountsTwitter {
                    let twitterAccountAction = UIAlertAction(title: accountTwitter.username, style: .Default, handler: { (actionTwitter) in
                        let twitterHandle = actionTwitter.title
                        for accountTwitter in TWITTER_AUTH_HELPER.accounts {
                            if twitterHandle == accountTwitter.username {
                                self.activityIndicator.startAnimating()
                                TWITTER_AUTH_HELPER.authenticateAccount(accountTwitter as! ACAccount, withCallback: { (errorTwitter, authDataTwitter) in
                                    self.activityIndicator.stopAnimating()
                                    if errorTwitter != nil {
                                    let alert = UIAlertController(title: "Erreur", message: errorTwitter.localizedDescription, preferredStyle: .Alert)
                                    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                                    alert.addAction(action)
                                    self.presentViewController(alert, animated: true, completion: nil)
                                } else {
                                    NSUserDefaults.standardUserDefaults().setValue(authDataTwitter.uid, forKey: "uid")
                                        print("Connecté")
                                }

                                })
                                
                            }
                        }
                    })
                    actionSheetController.addAction(twitterAccountAction)
                }
                self.presentViewController(actionSheetController, animated: true, completion: nil)
            }
        }
    }

    @IBAction func logoutAction(sender: AnyObject) {
        CURRENT_USER_TWITTER.unauth()
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        print("Déconnnecté")
    }
    

}









