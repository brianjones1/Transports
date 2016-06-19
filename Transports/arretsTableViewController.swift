//
//  arretsTableViewController.swift
//  Angers Transports
//
//  Created by Romain Rabouan on 10/02/16.
//  Copyright © 2016 Romain Rabouan. All rights reserved.
//

import UIKit

struct Arret {
  let name: String
  let surnom: String
}


class arretsTableViewController: UITableViewController {
  
  var arretsStop = [Arret]()
  var filteredArrets = [Arret]()
  
  let searchController = UISearchController(searchResultsController: nil)
  
  
  func filteredContentForSearchText(searchText: String, scope: String = "All") {
    filteredArrets = arretsStop.filter {
      arret in return arret.name.lowercaseString.containsString(searchText.lowercaseString)
      
    }
    tableView.reloadData()
  }
  
  struct Objects {
    var sectionName: String!
    var sectionObjects: [String]!
  }
  var objectsArray = [Objects]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.arretsStop = [
        // Ligne A
        Arret(name: "Roseraie", surnom: "Ligne A"), Arret(name: "Jean Vilar", surnom: "Ligne A"), Arret(name: "Jean XIII", surnom: "Ligne A"), Arret(name: "Bamako", surnom: "Ligne A"), Arret(name: "Strasbourg", surnom: "Place La Fayette"), Arret(name: "Les Gares", surnom: "Ligne A"), Arret(name: "Foch-Haras", surnom: "Ligne A, Ligne 1d, Ligne 3, Ligne 3s, Ligne 3d, Ligne 4"), Arret(name: "Foch Maison-Bleue", surnom: "Ligne A, Ligne 1, Ligne 1s, Ligne 1d, Ligne 2, Ligne 2s, Ligne 2d, Ligne 3, Ligne 3s, Ligne 3d, Ligne 4"), Arret(name: "Ralliement", surnom: "Ligne A"), Arret(name: "Molière", surnom: "Ligne A"), Arret(name: "Saint-Serge Université", surnom: "Ligne A"), Arret(name: "CHU-Hôpital", surnom: "Ligne A"), Arret(name: "Capucins", surnom: "Ligne A"), Arret(name: "Jean Moulin", surnom: "Ligne A, , Ligne 3d"), Arret(name: "Hauts de Saint-Aubin", surnom: "Ligne A"), Arret(name: "Verneau", surnom: "Ligne A"), Arret(name: "Terra Botanica", surnom: "Ligne A"), Arret(name: "Plateau Mayenne", surnom: "Ligne A"), Arret(name: "Bois du Roy", surnom: "Ligne A"), Arret(name: "Acacias", surnom: "Ligne A"), Arret(name: "Saint-Gilles", surnom: "Ligne A"),  Arret(name: "Bascule", surnom: "Ligne A"),  Arret(name: "Avrillé-Ardenne", surnom: "Ligne A"),
        // début ligne 1
        Arret(name: "Maison de Technopole (Belle Beille)", surnom: "Ligne 1, Ligne 1d, Ligne 4"), Arret(name: "IUT", surnom: "Ligne 1"), Arret(name: "Restaurant Univeristaire", surnom: "Ligne 1"), Arret(name: "Cité Univeritaire", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Maison des étudiants", surnom: "Ligne 1"), Arret(name: "Notre Dame du Lac", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Boisramé", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Chapelle Belle Beille", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Elysée", surnom: "Ligne 1, Ligne 1s, Ligne 1d, Ligne 4"), Arret(name: "Montesquieu", surnom: "Ligne 1, Ligne 1s, Ligne 1d, Ligne 4"), Arret(name: "Saint-Nicolas (direction Monplaisir", surnom: "Ligne 1"), Arret(name: "Saint Jacques", surnom: "Ligne 1"), Arret(name: "Monprofit", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Trinité", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Beaurepaire", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Poissonnerie", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "République", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Saint-Croix", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Office de Tourisme", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Gares Brémont", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Gares Papin", surnom: "Ligne 1, Ligne 1d, Ligne 4"), Arret(name: "Les Gares", surnom: "Ligne 1, Ligne 1s, Ligne 1d, Ligne 4"), Arret(name: "Foch-Haras", surnom: "Ligne 1, Ligne 1s"), Arret(name: "Foch-Saint-Aubin", surnom: "Ligne 1, Ligne 1s, Ligne 1d, Ligne 3s, Ligne 3d, Ligne 4"), Arret(name: "Mail (direc. Monplaisir)", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Joffre (direc. Monplaisir)", surnom: "Ligne 1, Ligne 1s"), Arret(name: "Sécurité Sociale", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Saint Exupéry", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Gardot", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Montaigne", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Fratellini (direction Monplaisir)", surnom: "Ligne 1"), Arret(name: "Jérusalem", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "2 Croix", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Thuleau", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Brisepotière", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Vaugereau", surnom: "Ligne 1, Ligne 1s, Ligne 1d"), Arret(name: "Allonneau", surnom: "Ligne 1, Ligne 1s"), Arret(name: "Place de l'Europe", surnom: "Ligne 1, Ligne 1s"), Arret(name: "Nozay", surnom: "Ligne 1, Ligne 1s, Ligne 1d, Ligne 3d"), Arret(name: "Auvergne", surnom: "Ligne 1, Ligne 1s, Ligne 1d, Ligne 3d"), Arret(name: "Monplaisir", surnom: "Ligne 1, Ligne 1s, Ligne 1d, Ligne 3d"),
        // début ligne 1s
        Arret(name: "L'Hoirie (Lac de Maine)", surnom: "Ligne 1s"), Arret(name: "Lacretelle", surnom: "Ligne 1s"), Arret(name: "Aliénor d'Aquitaine", surnom: "Ligne 1s"), Arret(name: "Shakespeare", surnom: "Ligne 1s"), Arret(name: "Wigan", surnom: "Ligne 1s"), Arret(name: "Grésillé", surnom: "Ligne 1s"), Arret(name: "Proudhon", surnom: "Ligne 1s"), Arret(name: "Lac de Maine Nautique", surnom: "Ligne 1s, Ligne 1d"), Arret(name: "Lac de Maine Accueil", surnom: "Ligne 1s, Ligne 1d"), Arret(name: "Pérussaie", surnom: "Ligne 1s, Ligne 1d"), Arret(name: "Les Deniers", surnom: "Ligne 1s, Ligne 1d"), Arret(name: "Monnet", surnom: "Ligne 1s, Ligne 1d"), Arret(name: "CNFPT", surnom: "Ligne 1s, Ligne 1d"), Arret(name: "Gaubert", surnom: "Ligne 1s, Ligne 1d"), Arret(name: "ESSCA", surnom: "Ligne 1s, Ligne 1d, Ligne 4"), Arret(name: "ISTIA", surnom: "Ligne 1s"), Arret(name: "Fratellini (direc. Lac de Maine)", surnom: "Ligne 1s"),
        // Début ligne 1d
        Arret(name: "Val de Maine", surnom: "Ligne 1d"), Arret(name: "Clos de la Vigne", surnom: "Ligne 1d"), Arret(name: "Châtaigneraie", surnom: "Ligne 1d"), Arret(name: "Groupe Commercial", surnom: "Ligne 1d"), Arret(name: "Pruniers", surnom: "Ligne 1d"), Arret(name: "Croisette", surnom: "Ligne 1d"), Arret(name: "Lac de Maine Camping", surnom: "Ligne 1d"), Arret(name: "Beaucouzé", surnom: "Ligne 1d"), Arret(name: "Chanterie", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Pinsons", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Grand Pin", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Prieuré", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Vauragère", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Rouaurie", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Route de la Meignanne", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Hermitage", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Promeniers", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Grange aux Belles", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Rodin", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Bourg de la Paille", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Le Landreau", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Grand Périgné", surnom: "Ligne 1d, Ligne 4"), Arret(name: "INRA", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Morel", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Le Nôtre", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Lakanal", surnom: "Ligne 1d, Ligne 4"), Arret(name: "De Farcy", surnom: "Ligne 1d"), Arret(name: "Bon Pasteur", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Aragon", surnom: "Ligne 1d, Ligne 4"), Arret(name: "Front de Maine", surnom: "Ligne 1d"), Arret(name: "Mail (direc. St Aubin la Salle", surnom: "Ligne 1d"), Arret(name: "Joffre (direc. Beaucouzé / Val de Maine", surnom: "Ligne 1d"), Arret(name: "Fratellini (direc. St Aubin la Salle", surnom: "Ligne 1d"), Arret(name: "Voltaire", surnom: "Ligne 1d"), Arret(name: "Route de Briollay", surnom: "Ligne 1d, Ligne 3d"), Arret(name: "Industrie", surnom: "Ligne 1d"), Arret(name: "Hôtellerie", surnom: "Ligne 1d"), Arret(name: "Debussy", surnom: "Ligne 1d"), Arret(name: "Bois l'Abbé", surnom: "Ligne 1d"), Arret(name: "Du Bellay", surnom: "Ligne 1d"), Arret(name: "Cottage", surnom: "Ligne 1d"), Arret(name: "Eventard", surnom: "Ligne 1d"), Arret(name: "Banchais", surnom: "Ligne 1d, Ligne 2"), Arret(name: "Romanerie", surnom: "Ligne 1d"), Arret(name: "Saillerie (direc. St Aubin la Salle", surnom: "Ligne 1d"), Arret(name: "Baronnerie (direc. Claverie)", surnom: "Ligne 1d"), Arret(name: "Pignonnière", surnom: "Ligne 1d"), Arret(name: "Claverie", surnom: "Ligne 1d"),
        // Début ligne 2
        Arret(name: "Trélazé", surnom: "Ligne 2, Ligne 2d"), Arret(name: "Buisson", surnom: "Ligne 2, Ligne 2d"), Arret(name: "République", surnom: "Ligne 2"), Arret(name: "Millot", surnom: "Ligne 2"), Arret(name: "Brisepotière", surnom: "Ligne 2"), Arret(name: "Parc Expo - Cité de l'Objet Connecté", surnom: "Ligne 2, Ligne 2d"), Arret(name: "St Sylvain", surnom: "Ligne 2, Ligne 2d"),
        // début ligne 2s
        Arret(name: "Trélazé Buisson", surnom: "Ligne 2s"), Arret(name: "République Trélazé", surnom: "Ligne 2s, Ligne 2d"), Arret(name: "Millot", surnom: "Ligne 2s, ligne 2d"), Arret(name: "Lorraine", surnom: "Ligne 2s, Ligne 3s, Ligne 4"),
        // Début ligne 2d
        Arret(name: "Vaugereau", surnom: "Ligne 2d"), Arret(name: "7 Sonnettes", surnom: "Ligne 2d"),
        // Début Ligne 3
      Arret(name: "Mûrs Erigné", surnom: "Ligne 3, Ligne 3d"), Arret(name: "La Buissaie", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Le Coteau", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Jean Carmet", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Hôtel de Ville", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Levesque", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Erigné", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Soland", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Grand Pressoir", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Barbotterie", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Monnier", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Château Erigné", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Bosquet", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Louet", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Dube", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Loire", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Mairie des Ponts de Cé", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Belle Poule", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Authion", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Cimetière des Ponts de Cé", surnom: "Ligne 3, Ligne 3s"), Arret(name: "Ruelles", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Sablons", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Trois Paroisses", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Pôle Tassigny (direc. Mûrs Erigné)", surnom: "Ligne 3"), Arret(name: "Allard", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "De Lattre", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "ESA", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Rabelais", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "André Leroy", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Patinoire (direc. Avrillé Adezière / Avrillé Salette)", surnom: "Ligne 3"), Arret(name: "Mendès France", surnom: "Ligne 3, Ligne 3s, Ligne 3d, Ligne 4"), Arret(name: "Carnot", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Mitterand", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Saint Jean", surnom: "Ligne 3"), Arret(name: "Arts et Métiers", surnom: "Ligne 3"), Arret(name: "Trinité", surnom: "Ligne 3"), Arret(name: "Decazeaux", surnom: "Ligne 3"), Arret(name: "Cimetière de l'Ouest", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Pomone", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Rêveries", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Meignanne", surnom: "Ligne 3, Ligne 3s, Ligne 3d"), Arret(name: "Val d'Or", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Clinique St Didier", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Grandmont", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Espace Jeunesse", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Champ des Martyrs", surnom: "Ligne 3, Ligne 3d"), Arret(name: "Maréchal Lyautey", surnom: "Ligne 3"), Arret(name: "Brassens", surnom: "Ligne 3"), Arret(name: "Beurrière", surnom: "Ligne 3"), Arret(name: "Poincaré", surnom: "Ligne 3"), Arret(name: "Maufinée", surnom: "Ligne 3"), Arret(name: "Mairie d'Avrillé", surnom: "Ligne 3"), Arret(name: "Cimetière d'Avrillé", surnom: "Ligne 3"), Arret(name: "Petite Garde", surnom: "Ligne 3"), Arret(name: "Ripollet", surnom: "Ligne 3"), Arret(name: "Ternière", surnom: "Ligne 3"), Arret(name: "Pièce du Moulin", surnom: "Ligne 3"), Arret(name: "La Boissière", surnom: "Ligne 3"), Arret(name: "Schwalbach", surnom: "Ligne 3"),
        // Début Ligne 3s
          Arret(name: "Pôle Tassigny (direc. Mairie des Ponts de Cé)", surnom: "Ligne 3s"), Arret(name: "Patinoire", surnom: "Ligne 3s, Ligne 3d"), Arret(name: "La Rochefoucauld", surnom: "Ligne 3s, Ligne 3d"), Arret(name: "Hôtel Dieu", surnom: "Ligne 3s, Ligne 3d"), Arret(name: "Bichon", surnom: "Ligne 3s, Ligne 3d"), Arret(name: "Descazeaux", surnom: "Ligne 3s, Ligne 3d"), Arret(name: "Grandmont (direc. Avrillé Val d'Or)", surnom: "Ligne 3s"), Arret(name: "Clinique St Didier (direc. Avrillé Val d'Or)", surnom: "Ligne 3s"), Arret(name: "Avrillé Val d'Or", surnom: "Ligne 3s"),
        // Début ligne 3d
          Arret(name: "Patureaux", surnom: "Ligne 3d"), Arret(name: "Gallieni", surnom: "Ligne 3d"), Arret(name: "8 Mai", surnom: "Ligne 3d"), Arret(name: "La Chesnaie", surnom: "Ligne 3d"), Arret(name: "Centre Commercial", surnom: "Ligne 3d"), Arret(name: "Pôle Tassigny (direction Mûrs-Erigné)", surnom: "Ligne 3d"), Arret(name: "Kennedy", surnom: "Ligne 3d"), Arret(name: "Echman", surnom: "Ligne 3d"), Arret(name: "Lizé", surnom: "Ligne 3d"), Arret(name: "Petites Pannes", surnom: "Ligne 3d"), Arret(name: "Peluau", surnom: "Ligne 3d"), Arret(name: "Auriol - Verneau", surnom: "Ligne 3d"), Arret(name: "Charnasserie", surnom: "Ligne 3d"), Arret(name: "Fraternité", surnom: "Ligne 3d"), Arret(name: "Carrefour St Serge", surnom: "Ligne 3d"), Arret(name: "Ramon", surnom: "Ligne 3d"),
        // Début ligne 4
          Arret(name: "Saint-Barthélémy", surnom: "Ligne 4"), Arret(name: "Venaiserie", surnom: "Ligne 4"), Arret(name: "Cézanne", surnom: "Ligne 4"), Arret(name: "Verdun", surnom: "Ligne 4"), Arret(name: "Pasteur", surnom: "Ligne 4"), Arret(name: "Jaudette", surnom: "Ligne 4"), Arret(name: "Walcourt", surnom: "Ligne 4"), Arret(name: "Morlière", surnom: "Ligne 4"), Arret(name: "Centre Equestre", surnom: "Ligne 4"), Arret(name: "Pellerinière", surnom: "Ligne 4"), Arret(name: "Stade de St Barthélémy", surnom: "Ligne 4"), Arret(name: "Aubépine", surnom: "Ligne 4"), Arret(name: "Gemmetrie", surnom: "Ligne 4"), Arret(name: "Jules Ferry", surnom: "Ligne 4"), Arret(name: "Croix de Cheminée", surnom: "Ligne 4"), Arret(name: "Paperie", surnom: "Ligne 4"), Arret(name: "La Reux", surnom: "Ligne 4"), Arret(name: "Chêne Vert", surnom: "Ligne 4"), Arret(name: "Arceau", surnom: "Ligne 4"), Arret(name: "AFPA", surnom: "Ligne 4"), Arret(name: "Cimetière de l'Est", surnom: "Ligne 4"), Arret(name: "Lamartine (direc. St Barthélémy)", surnom: "Ligne 4"), Arret(name: "Bellefontaine", surnom: "Ligne 4"), Arret(name: "Pierre Lise", surnom: "Ligne 4"), Arret(name: "Gares Bremont", surnom: "Ligne 4"), Arret(name: "Château", surnom: "Ligne 4"), Arret(name: "Balzac", surnom: "Ligne 4"), Arret(name: "Patton", surnom: "Ligne 4"), Arret(name: "La Barre", surnom: "Ligne 4"), Arret(name: "Gaubert", surnom: "Ligne 4"), Arret(name: "Beaucouzé - Haute Roche", surnom: "Ligne 4"), Arret(name: "Monod", surnom: "Ligne 4"), Arret(name: "Citronnelle", surnom: "Ligne 4"), Arret(name: "Echats", surnom: "Ligne 4"), Arret(name: "Le Corbusier", surnom: "Ligne 4"), Arret(name: "Boulle", surnom: "Ligne 4"), Arret(name: "Beaucouzé - L'Atoll", surnom: "Ligne 4")]
    
   
    
    
    
    searchController.searchResultsUpdater = self
    searchController.dimsBackgroundDuringPresentation = false
    definesPresentationContext = true
    tableView.tableHeaderView = searchController.searchBar
    
    var refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: Selector("sortArray"), forControlEvents: UIControlEvents.ValueChanged)
    var attr = [NSForegroundColorAttributeName:UIColor.blackColor()]
    refreshControl.attributedTitle = NSAttributedString(string: "Lâchez pour actualiser", attributes: attr)
    self.refreshControl = refreshControl
  }
  
    func sortArray() {
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searchController.active && searchController.searchBar.text != "" {
      return filteredArrets.count
    }
    return self.arretsStop.count
    
  }
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cellIdentifier = "ArretTableViewCell"
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    var searcharret: Arret
    if searchController.active && searchController.searchBar.text != "" {
      searcharret = filteredArrets[indexPath.row]
    } else {
      searcharret = arretsStop[indexPath.row]
    }
    let arret = arretsStop[indexPath.row]
    
    
    // HERE BELOW THIS LINE
    
    cell.textLabel?.text = searcharret.name
    cell.detailTextLabel?.text = searcharret.surnom
        
    return cell
  }
 /* override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDetail" {
      let arretsDetailViewController = segue.destinationViewController as! detailArretViewController
      
      // GET THE CELL THAT GENERETED THIS SEGUE.
      if let selectedArretCell = sender as? ArretTableViewCell {
        let indexPath = tableView.indexPathForCell(selectedArretCell)!
        let selectedArret = arretsStop[indexPath.row]
        arretsDetailViewController.arret = selectedArret
      }
      
    }
  }
  */

  
}

extension arretsTableViewController: UISearchResultsUpdating {
  func updateSearchResultsForSearchController(searchController: UISearchController) {
    filteredContentForSearchText(searchController.searchBar.text!)
  }
}
