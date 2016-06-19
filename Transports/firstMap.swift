//
//  firstMap.swift
//  Angers Transports
//
//  Created by Romain Rabouan on 10/02/16.
//  Copyright © 2016 Romain Rabouan. All rights reserved.
//

import UIKit
import MapKit

class firstMap: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var lineLabel: UILabel!
    
    @IBAction func changeLine(sender: UIButton) {
        // Change the line that is displayed on the map
        
    }
        @IBOutlet weak var mapView: MKMapView!
    @IBAction func cancel(segue: UIStoryboardSegue) {
        //
    }
    
  let btn = UIButton(type: .DetailDisclosure)
  
  func getMapAnnotations() -> [mesStations] {
    var annotations:Array = [mesStations]()
    
    
    // Load plist file
    var stations: NSArray?
    if let path = NSBundle.mainBundle().pathForResource("stations", ofType: "plist") {
      stations = NSArray(contentsOfFile: path)
    }
    if let items = stations {
      for item in items {
        let lat = item.valueForKey("lat") as! Double
        let long = item.valueForKey("long")as! Double
        let annotation = mesStations(latitude: lat, longitude: long)
        annotation.title = item.valueForKey("title") as? String
        annotations.append(annotation)
        
      
      }
    }
    return annotations
  }

  
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    // 1
    mapView.delegate = self
    
    // 2
    
    let location = MKCoordinateRegionMake(CLLocationCoordinate2DMake(47.478419, -0.563166000000238), MKCoordinateSpanMake(0.1766154, 0.153035))
    mapView.setRegion(location, animated: true)
    let annotations = getMapAnnotations()
    // Add mappoints to Map
    mapView.addAnnotations(annotations)
    mapView.delegate = self
    // Connect all the mappoints using Poly line.
    
    var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
    
    for annotation in annotations {
      points.append(annotation.coordinate)
    }
    var polyline = MKPolyline(coordinates: &points, count: points.count)
    mapView.addOverlay(polyline)
    
    
    
    
    
    
    
  }
  //MARK:- MapViewDelegate methods
  
  func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
    if overlay is MKPolyline {
      var polylineRenderer = MKPolylineRenderer(overlay: overlay)
      polylineRenderer.strokeColor = UIColor.blueColor()
      polylineRenderer.lineWidth = 5
      return polylineRenderer
    }
    
    return nil
  }
  func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView! {
    let identifier = "Capital"
    if annotation.isKindOfClass(firstMap) {
      var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        annotationView?.annotation = annotation
        return annotationView
      
      if annotationView == nil {
        annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        annotationView!.canShowCallout = true
        
        let removeButton = UIButton(type: .Custom)
        removeButton.frame = CGRect(x: 0, y: 0, width: 23, height: 23)
        removeButton.setImage(UIImage(named: "DeleteGeotification")!, forState: .Normal)
        annotationView?.leftCalloutAccessoryView = removeButton
        
        
        
      } else {
        annotationView!.annotation = annotation
        
        let btn = UIButton(type: .DetailDisclosure)
        annotationView?.rightCalloutAccessoryView = btn
        return annotationView
      }
      return annotationView
    }
    return nil
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "goToGeotification" {
      let navigationControllerGeo = segue.destinationViewController as! UINavigationController
      let vc = navigationControllerGeo.viewControllers.first as! GeotificationsViewController
    
        
      
    }
  }
    // MARK: - Delegate
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
  

}

