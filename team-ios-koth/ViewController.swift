//
//  ViewController.swift
//  team-ios-koth
//
//  Created by DC, DE, DG on 5/11/17.
//  Copyright © 2017. All rights reserved.
//

import UIKit
import CoreLocation

// Get user location
// Create fence with user location
// Check for user inside or outside of fence

// access to UIViewController methods
class ViewController: UIViewController {
    
    var locationManager: CLLocationManager?
    var startLocation: CLLocation?
    var testDelegate: CLLocationManagerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocationManager()
        
        
        // location manager set up
        // locationManager.startMonitoring(for region: CLRegion)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// access to CLLocationManagerDelegate methods
extension ViewController: CLLocationManagerDelegate {
    
    /*
     
     */
    func setupLocationManager(){

        // create instance of CLLocationManager
        locationManager = CLLocationManager()
        
        // view controller can now receive the relevant delegate method calls
        locationManager?.delegate = self
        
        // checks user authorization
        locationManager?.requestWhenInUseAuthorization()
        
        //
        locationManager?.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest

        
        // starts generation of updates that report user's current location
        locationManager?.startUpdatingLocation()
        
        // App registers for location updates? (code from iDan: slack)
        self.locationManager?.allowsBackgroundLocationUpdates = true
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let locations = location[0]
//    }
    
    // create fence with location, radius, and test id
    // return fence
    func createFence(startLocation: CLLocation, newRadius: CLLocationDistance, fenceID: String) -> CLCircularRegion {
//        let ourRadius = 10.0
//        let ourString = "test_id"
        let fence = CLCircularRegion(
            center: startLocation.coordinate,
            radius: newRadius,
            identifier: fenceID)
        // registers region in 'monitoredRegions' property
        locationManager?.startMonitoring(for: fence)
        return fence
    }
    
    func checkIfInFence(fenceToCheck: CLCircularRegion) {
        
    }


    
    // isMonitoringAvailable, if yes: create region. Then monitor region and print region
    func setupData() {
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self){
            let title = "Lorrenzillo's"
            let coordinate = CLLocationCoordinate2DMake(37.703026, -121.759735)
            let regionRadius = 300.0
            
            let region = CLCircularRegion(
                center: CLLocationCoordinate2D(latitude: coordinate.latitude,longitude: coordinate.longitude),radius: regionRadius, identifier: title)
            
            // registers region in 'monitoredRegions' property
            locationManager?.startMonitoring(for: region)
            print(region)
            
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState,for region: CLRegion) {
        if state == .inside {
            print ("inside")
        }
        else if state == .outside {
            print ("outside")
        }
        else if state == .unknown {
            print("Unknown state for geofence")
            return
        }
    }
    

    
}

    
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if startLocation == nil {
//            startLocation = locations.first
//        } else {
//            guard let latest = locations.first else { return }
//            let distanceInMeters = startLocation?.distance(from: latest)
//            print("distance in meters: \(String(describing: distanceInMeters!))")
//        }
//    }
//    
//     func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedAlways || status == .authorizedWhenInUse {
//            locationManager?.startUpdatingLocation()
//            locationManager?.allowsBackgroundLocationUpdates = true
//        }
//    }
//    




//    
//    func createFence(startLocation: CLLocation) -> CLCircularRegion {
//        let fence = CLCircularRegion(
//            center: startLocation.coordinate,
//            radius: ourRadius,
//            identifier: ourString)
//            
//        return fence
//        }
//
//    func startMonitoring(for ourFence:() -> CLCircularRegion){
//        
//        print (ourFence)
//        
//    }
//}
