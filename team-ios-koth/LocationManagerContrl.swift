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
        
        treasureFenceLoc = CLLocation.init(
            latitude: ((userLoc!.latitude) + ((latPosNegToggle!)*(drand48()/100))),
            longitude: ((userLoc!.longitude) + ((longPosNegToggle!)*drand48()/100)))
        let treasureFence = createFence(spawnLoc: treasureFenceLoc!, newRadius: 10000.00, fenceID: "treasure")
        locationManager?.startMonitoring(for: treasureFence)
        print(treasureFence)
        addRadiusOverlay(treasureFence: treasureFence)
        
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
        
    }
    
    
}
