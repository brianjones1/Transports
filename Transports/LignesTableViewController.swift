//
//  LignesTableViewController.swift
///  Angers Transports
//
//  Created by Romain Rabouan on 10/02/16.
//  Copyright © 2016 Romain Rabouan. All rights reserved.
//

import UIKit
import CoreData

class LignesTableViewController: UITableViewController {
  
  // MARK: Propreties
  
  var lignes = [Ligne]()
    var identities = [String]()
  
  struct Objects {
    var sectionName: String!
    var sectionObjects: [String]!
  }
  var objectsArray = [Objects]()
    
    
  
    @IBAction func shareBtn(sender: UIBarButtonItem) {
        print("Shared :)")
        if let send: String? = "J'utilise l'application Angers Transports, l'application de référence pour les transports en commun Angevins ! Venez l'essayer avec moi ! #Angers https://www.angerstransports.fr/download" {
            let objectToShare = [send!]
            let activityVC = UIActivityViewController(activityItems: objectToShare, applicationActivities: nil)
            self.presentViewController(activityVC, animated: true, completion: nil)
            
        }
    }
   
    
  override func viewDidLoad() {
    super.viewDidLoad()
    self.lignes = [Ligne(name: "Ligne A - Roseraie <-> Avrillé-Ardenne", subtitle: "Tramway"), Ligne(name: "Ligne 1 - Belle Beille <-> Monplaisir", subtitle: "Bus-Métropole"), Ligne(name: "Ligne 2 - Saint Sylvain/Banchais <-> Trélazé", subtitle: "Bus-Métropole"), Ligne(name: "Ligne 3 - Avrillé-Adézière/Avrillé-Sallette <-> Mûrs Érigné", subtitle: "Bus-Métropole"), Ligne(name: "Ligne 4 - Saint Barthélemy <-> Beaucouzé - Haute Roche / Beaucouzé-L'Atoll", subtitle: "Bus-Métropole"), Ligne(name: "Ligne 5 - Verneau -AquaVita", subtitle: "Bus Circulaire"), Ligne(name: "Ligne 6 - Bouchemaine/Chantourteau <-> ZI Est", subtitle: "Bus Citadin"), Ligne(name: "Ligne 7 - Montreuil/Juigné/Domaine du Val/Feneu <-> Lorraine", subtitle: "Bus Citadin"), Ligne(name: "Ligne 8 - Verneau-AquaVita/CHU-Hôpital <-> Moulin Marcille/Mairie des Ponts de Cé", subtitle: "Bus Citadin"), Ligne(name: "Ligne 9 - Eventard <-> Espace Anjou", subtitle: "Bus Citadin"), Ligne(name: "Ligne 10 - Schweitzer/Pôle 49 <-> St Lézin-ZI Trélazé/Sorges", subtitle: "Bus Citadin"), Ligne(name: "Ligne 11 - Lac de Maine/ZI Beaucouzé <-> Clinique de l'Anjou/Ste Gemmes sur Loire", subtitle: "Bus Citadin"), Ligne(name: "Ligne 12 - St Aubin la Salle <-> M.Marcille/Vernusson", subtitle: "Bus Citadin"), Ligne(name: "Ligne 14 - Belle Beille <-> Les Gares", subtitle: "Bus Citadin / Express")]
    identities = ["A", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "14"]
    
    var refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: Selector("sortArray"), forControlEvents: .ValueChanged)
    var attr = [NSForegroundColorAttributeName:UIColor.blackColor()]
    var font = [NSFontAttributeName: UIFont(name: "Helvetica", size: 12.0)]
    refreshControl.attributedTitle = NSAttributedString(string: "Lâchez pour actualiser", attributes: attr)
    
    self.refreshControl = refreshControl
   
    

  }
    
    func sortArray() {
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.lignes.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    
    var ligne : Ligne
    
    ligne = lignes[indexPath.row]
    
    cell.textLabel?.text = ligne.name
    cell.detailTextLabel?.text = ligne.subtitle
    
    
    cell.imageView?.image = UIImage(named: "numero\(indexPath.row)")
    cell.imageView?.layer.masksToBounds = true
    cell.imageView?.layer.cornerRadius = 5
    return cell
    
  }
override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewControllerName = identities[indexPath.row]
        let vc = storyboard?.instantiateViewControllerWithIdentifier(viewControllerName)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
  
  
}








