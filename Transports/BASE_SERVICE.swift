//
//  BASE_SERVICE.swift
//  Transports
//
//  Created by Romain Rabouan on 06/04/16.
//  Copyright © 2016 RomainRabouan. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL = "https://angerstransports.firebaseio.com"
let FIREBASE_REF = Firebase(url: BASE_URL)

var CURRENT_USER: Firebase {
    let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
    let currentUser = Firebase(url: "\(FIREBASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
    return currentUser!
}