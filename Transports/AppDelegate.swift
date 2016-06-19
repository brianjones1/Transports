//
//  AppDelegate.swift
//  Angers Transports
//
//  Created by Romain Rabouan on 10/02/16.
//  Copyright © 2016 Romain Rabouan. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate, GIDSignInDelegate {

  var window: UIWindow?
  
  let locationManager = CLLocationManager()

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestAlwaysAuthorization()
    application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound,], categories: nil))
    UIApplication.sharedApplication().cancelAllLocalNotifications()
    UIApplication.sharedApplication().statusBarStyle = .LightContent
    
    
    // Initialize sign-in
    var configureError: NSError?
    GGLContext.sharedInstance().configureWithError(&configureError)
    assert(configureError == nil, "Error configuring Google services: \(configureError)")
    
    GIDSignIn.sharedInstance().delegate = self
    
    return true
  }
func application(application: UIApplication,
                     openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        var options: [String: AnyObject] = [UIApplicationOpenURLOptionsSourceApplicationKey: sourceApplication!,
                                            UIApplicationOpenURLOptionsAnnotationKey: annotation!]
        return GIDSignIn.sharedInstance().handleURL(url,
                                                    sourceApplication: sourceApplication,
                                                    annotation: annotation)
    }
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
        } else {
            print("\(error.localizedDescription)")
        }
    }
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
                withError error: NSError!) {
        // Perform any operations when the user disconnects from app here.
        // [START_EXCLUDE]
        NSNotificationCenter.defaultCenter().postNotificationName("ToggleAuthUINotification", object: nil, userInfo: ["statusText": "User has disconnected."])
        // [END_EXCLUDE]
    }


  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  func handleRegionEvent(region: CLRegion!) {
    if UIApplication.sharedApplication().applicationState == .Active {
      if let message = notefromRegionIdentifier(region.identifier) {
        if let viewController = window?.rootViewController {
          showSimpleAlertWithTitle(nil, message: message, viewController: viewController)
        }
      }
    } else {
      // Otherwise present a local notification
      var notification = UILocalNotification()
      notification.alertBody = notefromRegionIdentifier(region.identifier)
      notification.soundName = "Default";
      UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    
    }
  }
  func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
    if region is CLCircularRegion {
      handleRegionEvent(region)
    }
  }
  
  func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
    if region is CLCircularRegion {
      handleRegionEvent(region)
    }
  }
    
    
  func notefromRegionIdentifier(identifier: String) -> String? {
    if let savedItems = NSUserDefaults.standardUserDefaults().arrayForKey(kSavedItemsKey) {
      for savedItem in savedItems {
        if let geotification = NSKeyedUnarchiver.unarchiveObjectWithData(savedItem as! NSData) as? Geotification {
          if geotification.identifier == identifier {
            return geotification.note
          }
        }
      }
    }
    return nil
  }
}

