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

// Get user location
// Create fence with user location
// Check for user inside or outside of fence

// Get user location
// Spawn fence
// Check compass direction
// Compare compass with fence
// Display needed direction for user
// access to UIViewController methods
class ViewController: UIViewController {
    
    @IBOutlet weak var TPMap: MKMapView!
    var locationManager: CLLocationManager?
    var startLocation: CLLocation?
    var userLoc: CLLocationCoordinate2D?
    var treasureFence: CLCircularRegion?
    var treasureFenceLoc: CLLocation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocationManager()
        setupMapView()
        startHeading()
        
        DispatchQueue.main.async {
            self.locationManager?.startUpdatingLocation()
        }
        
    }
    
    @IBAction func spawnTreasure(_ sender: UIButton) {
        spawnTreasureFence()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

