//
//  ViewController.swift
//  team-ios-koth
//
//  Created by DC, DE, DG on 5/11/17.
//  Copyright © 2017. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager: CLLocationManager?
    var startLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup locationManager
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager?.requestWhenInUseAuthorization()
        
        //test setupData
        createFence()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension ViewController: CLLocationManagerDelegate {
    
    func createFence() {
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self){
            let title = "Lorrenzillo's"
            let coordinate = CLLocationCoordinate2DMake(37.703026, -121.759735)
            let regionRadius = 300.0
            
            let region = CLCircularRegion(
                center: CLLocationCoordinate2D(latitude: coordinate.latitude,longitude: coordinate.longitude),radius: regionRadius, identifier: title)
            locationManager?.startMonitoring(for: region)
            print(region)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region is CLCircularRegion {
            print ("enter")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region is CLCircularRegion {
            print ("exit")
        }
    }


    
//    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState,for region: CLRegion) {
//        if state == .inside {
//            print ("inside")
//        }
//        else if state == .outside {
//            print ("outside")
//        }
//        else if state == .unknown {
//            print("Unknown state for geofence")
//            return
//        }
//    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        locationManager?.requestState(for: region)
//    }
}

extension ViewController: MKMapViewDelegate {
    
}
