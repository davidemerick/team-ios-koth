//
//  ViewController.swift
//  team-ios-koth
//
//  Created by DC, DE, DG on 5/11/17.
//  Copyright © 2017. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var enterRegionLabel: UILabel!
    
    
    
    var locationManager: CLLocationManager = CLLocationManager()
    let fence: CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(47.609930, -122.196759), radius: CLLocationDistance(20), identifier: "coding dojo")
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            
            let currentLocation = locations.first
            let currentLocation2D = CLLocationCoordinate2DMake(currentLocation!.coordinate.latitude, currentLocation!.coordinate.longitude)
            

            testLabel.text =  String(fence.contains(currentLocation2D))
//            if !fence.contains(currentLocation2D){
//                    enterRegionLabel.text = "not in region"
//            }
            
            
        }
        
        
    }
    func locationManager(_ manager: CLLocationManager,
                                  didEnterRegion region: CLRegion){
        print("did enter region!")
        enterRegionLabel.text = "you entered region: \(region.identifier)"
    }
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        enterRegionLabel.text = "you exited region: \(region.identifier)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(fence)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoring(for: fence)
        
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



