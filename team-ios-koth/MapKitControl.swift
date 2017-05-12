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
        TPMap.delegate = self
        TPMap.showsUserLocation = true
    }
    
    // function always running, updating locations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last as CLLocation? else { return }
        
        // centers map on user
        userLoc = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        // zooms in to map
        let zoomMe = MKCoordinateSpanMake(0.050, 0.050)
        // defines mapkit region
        let region = MKCoordinateRegion(center: userLoc!, span: zoomMe)
        // sets mapkit region
        TPMap.setRegion(region, animated: true)
    }
    
    func addRadiusOverlay(treasureFence: CLCircularRegion) {
        TPMap?.add(MKCircle(center: treasureFence.center, radius: treasureFence.radius))
    }
}
