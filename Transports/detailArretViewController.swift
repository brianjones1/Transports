//
//  detailArretViewController.swift
//  Angers Transports
//
//  Created by Romain Rabouan on 10/02/16.
//  Copyright © 2016 Romain Rabouan. All rights reserved.
//

import UIKit

class detailArretViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationItem!

    @IBOutlet weak var textLabel: UILabel!
  
  var arretsIndex: Int = 0
  var nomArret = [Arret]()
  
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
