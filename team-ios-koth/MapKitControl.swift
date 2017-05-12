//
//  MapKitControl.swift
//  team-ios-koth
//
//  Main MapKit code is here
//
//  Created by DE on 5/12/17.
//  Copyright © 2017 DE. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit


extension ViewController: MKMapViewDelegate {
    
    // MapView setup
    func setupMapView(){
        testMap.delegate = self
        testMap.showsUserLocation = true
    }
    
    // function always running, updating locations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last as CLLocation? else { return }
        
        // centers map on user
        let userCenter = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        // zooms in to map
        let zoomMe = MKCoordinateSpanMake(0.050, 0.050)
        // defines mapkit region
        let region = MKCoordinateRegion(center: userCenter, span: zoomMe)
        // sets mapkit region
        testMap.setRegion(region, animated: true)
    }
}
