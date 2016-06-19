//
//  mesStations.swift
//  Angers Transports
//
//  Created by Romain Rabouan on 10/02/16.
//  Copyright © 2016 Romain Rabouan. All rights reserved.
//

import MapKit


class mesStations: NSObject, MKAnnotation {
  var title: String?
  var subtitle: String?
  var latitude: Double
  var longitude: Double
  
  var coordinate: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    
  }
  init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }
}
