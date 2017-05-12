//
//  LocationManagerControl.swift
//  team-ios-koth
//
//  Main CLLocationManager code is here
//
//  Created by DE on 5/12/17.
//  Copyright © 2017 DE. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

extension ViewController: CLLocationManagerDelegate {
    
        func spawnTreasureFence(){
            
           // let randomLat = (drand48()/10)
           // let randomLong = (drand48()/10)
            var latPosNegToggle: Double?
            var longPosNegToggle: Double?

            if(arc4random_uniform(2) == 1){
                 latPosNegToggle = 1.0
            } else {
                 latPosNegToggle = -1.0
            }
            
            if(arc4random_uniform(2) == 1){
                longPosNegToggle = 1.0
            } else {
                longPosNegToggle = -1.0
            }
            
            //let userLoc = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let treasureFenceLoc = CLLocation(
                // hard code: San Fran
                latitude: ((37.7749) + ((latPosNegToggle!)*(drand48()/100))),
                longitude: ((122.4194) + ((longPosNegToggle!)*drand48()/100)))
            let treasureFence = createFence(spawnLoc: treasureFenceLoc, newRadius: 1000.00, fenceID: "treasure")
            print(treasureFence)
            addRadiusOverlay(treasureFence: treasureFence)
            
        }
    
    
    func testFenceSpawn(){
        //<wpt lat="37.331695" lon="-122.0322801">
        let myFenceLoc = CLLocation.init(latitude: 37.331695, longitude: -122.0322801)
        
        let fenceToTest = createFence(spawnLoc: myFenceLoc, newRadius: 1000.0, fenceID: "testFence")
        locationManager?.startMonitoring(for: fenceToTest)
        print(fenceToTest)
    }
    
    func setupLocationManager(){
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
        // App registers for location updates? (code from iDan: slack)
        self.locationManager?.allowsBackgroundLocationUpdates = true
    }
    
    func createFence(spawnLoc: CLLocation, newRadius: CLLocationDistance, fenceID: String) -> CLCircularRegion {
        
        let fence = CLCircularRegion(
            center: spawnLoc.coordinate,
            radius: newRadius,
            identifier: fenceID)
        
        // registers with locationManager
        locationManager?.startMonitoring(for: fence)
        fence.notifyOnEntry = true
        fence.notifyOnExit = true
        return fence
    }
    
    func startHeading(){
        // Checks if heading data is vailable on device
        //if CLLocationManager.headingAvailable(){
        
        // locationManager starts receiving heading data
        locationManager?.startUpdatingHeading()
        
        // notifies locationManager of all movements
        locationManager?.headingFilter = kCLHeadingFilterNone
        //}
    }
    
    // delegate method invoked when the location manager has heading data
    // cannot test: iOS simulator does not do heading
    func locationManager(_ manager: CLLocationManager,
                         didUpdateHeading newHeading: CLHeading){
        print (newHeading.trueHeading)
        print (newHeading.magneticHeading)
        
    }
    
//    func getUserLocOnce() {
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) -> CLLocationCoordinate2D {
//            //guard let location = locations.last as CLLocation? else { return }
//            let location = locations.last as CLLocation?
//            let currentLoc = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: (location?.coordinate.longitude)!)
//            return currentLoc
//        }
//
//    }

}
