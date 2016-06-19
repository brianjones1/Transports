//
//  BaseServiceTwitter.swift
//  Transports
//
//  Created by Romain Rabouan on 07/05/16.
//  Copyright © 2016 RomainRabouan. All rights reserved.
//

import Firebase

let BASE_URL_TWITTER = "https://angerstransports.firebaseio.com"
let TWITTER_KEY_API = "nYbncFw8y0cP2HN4RdPXlU5C0"

let FIREBASE_REF_TWITTER = Firebase(url: BASE_URL_TWITTER)
let TWITTER_AUTH_HELPER = TwitterAuthHelper(firebaseRef: FIREBASE_REF, apiKey: TWITTER_KEY_API)

var CURRENT_USER_TWITTER : Firebase {
    let userIDTwitter = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
    let currentUser = FIREBASE_REF.childByAppendingPath("users").childByAppendingPath(userIDTwitter)
    return currentUser!
}