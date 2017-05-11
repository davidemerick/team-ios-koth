//
//  ViewController.swift
//  team-ios-koth
//
//  Created by DC, DE, DG on 5/11/17.
//  Copyright © 2017. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager: CLLocationManager?
    var startLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager?.requestWhenInUseAuthorization()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if startLocation == nil {
            startLocation = locations.first
        } else {
            guard let latest = locations.first else { return }
            let distanceInMeters = startLocation?.distance(from: latest)
            print("distance in meters: \(String(describing: distanceInMeters!))")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager?.startUpdatingLocation()
            locationManager?.allowsBackgroundLocationUpdates = true
        }
    }
    
}



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
