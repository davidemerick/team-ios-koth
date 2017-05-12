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
    

    
    //    func spawnTreasureFence(){
    //        let treasureFenceLoc =
    //    }
    
    func testFenceSpawn(){
        //<wpt lat="37.331695" lon="-122.0322801">
        let myFenceLoc = CLLocation.init(latitude: 37.331695, longitude: -122.0322801)
        
        let fenceToTest = createFence(startLocation: myFenceLoc, newRadius: 1000.0, fenceID: "testFence")
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
    
    func createFence(startLocation: CLLocation, newRadius: CLLocationDistance, fenceID: String) -> CLCircularRegion {
        
        let fence = CLCircularRegion(
            center: startLocation.coordinate,
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
}
