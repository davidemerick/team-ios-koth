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
    
    @IBOutlet weak var testMap: MKMapView!
    var locationManager: CLLocationManager?
    var startLocation: CLLocation?
    var userLoc: CLLocationCoordinate2D?
    var treasureFence: CLCircularRegion?
    var treasureFenceLoc: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View loaded")
        setupLocationManager()
//        testFenceSpawn()
        //spawnTreasureFence()
        setupMapView()
        startHeading()
        // iffy testy code
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



    

    /*
            DEPRECATED
    */

//    // monitoring state of region
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


//    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion){
//        print("entered fence")
//    }
//
//    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion){
//        print("exited fence")
//    }


//    // isMonitoringAvailable, if yes: create region. Then monitor region and print region
//    func setupData() {
//        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self){
//            let title = "Lorrenzillo's"
//            let coordinate = CLLocationCoordinate2DMake(37.703026, -121.759735)
//            let regionRadius = 300.0
//
//            let region = CLCircularRegion(
//                center: CLLocationCoordinate2D(latitude: coordinate.latitude,longitude: coordinate.longitude),radius: regionRadius, identifier: title)
//
//            // registers region in 'monitoredRegions' property
//            locationManager?.startMonitoring(for: region)
//            print(region)
//
//        }
//    }
//

    
    
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



//import UIKit
//import CoreLocation
//
//class ViewController: UIViewController {
//    
//    var locationManager: CLLocationManager?
//    var startLocation: CLLocation?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        locationManager = CLLocationManager()
//        locationManager?.delegate = self
//        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        
//        locationManager?.requestWhenInUseAuthorization()
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//}
//
//
//extension ViewController: CLLocationManagerDelegate {
//    
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
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedAlways || status == .authorizedWhenInUse {
//            locationManager?.startUpdatingLocation()
//            locationManager?.allowsBackgroundLocationUpdates = true
//        }
//    }
//    
//}


/*
        MOVED TO OTHER FILE
 */

// MapView related methods
//extension ViewController: MKMapViewDelegate {
//
//    // MapView setup
//    func setupMapView(){
//        testMap.delegate = self
//        testMap.showsUserLocation = true
//    }
//
//    // function always running, updating locations
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last as CLLocation? else { return }
//
//        // centers map on user
//        let userCenter = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        // zooms in to map
//        let zoomMe = MKCoordinateSpanMake(0.050, 0.050)
//        // defines mapkit region
//        let region = MKCoordinateRegion(center: userCenter, span: zoomMe)
//        // sets mapkit region
//        testMap.setRegion(region, animated: true)
//    }
//}

// access to CLLocationManagerDelegate methods
//extension ViewController: CLLocationManagerDelegate {
//    
//    func startHeading(){
//        // Checks if heading data is vailable on device
//        //if CLLocationManager.headingAvailable(){
//        
//        // locationManager starts receiving heading data
//        locationManager?.startUpdatingHeading()
//        
//        // notifies locationManager of all movements
//        locationManager?.headingFilter = kCLHeadingFilterNone
//        //}
//    }
//    
//    // delegate method invoked when the location manager has heading data
//    // cannot test: iOS simulator does not do heading
//    func locationManager(_ manager: CLLocationManager,
//                         didUpdateHeading newHeading: CLHeading){
//        print (newHeading.trueHeading)
//        print (newHeading.magneticHeading)
//        
//    }
//    
//    //    func spawnTreasureFence(){
//    //        let treasureFenceLoc =
//    //    }
//    
//    func testFenceSpawn(){
//        //<wpt lat="37.331695" lon="-122.0322801">
//        let myFenceLoc = CLLocation.init(latitude: 37.331695, longitude: -122.0322801)
//        
//        let fenceToTest = createFence(startLocation: myFenceLoc, newRadius: 1000.0, fenceID: "testFence")
//        locationManager?.startMonitoring(for: fenceToTest)
//        print(fenceToTest)
//    }
//    
//    /*
//     
//     */
//    func setupLocationManager(){
//        
//        // create instance of CLLocationManager
//        locationManager = CLLocationManager()
//        
//        
//        // view controller can now receive the relevant delegate method calls
//        locationManager?.delegate = self
//        
//        // checks user authorization
//        locationManager?.requestWhenInUseAuthorization()
//        
//        //
//        locationManager?.distanceFilter = kCLLocationAccuracyNearestTenMeters
//        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        
//        
//        // starts generation of updates that report user's current location
//        locationManager?.startUpdatingLocation()
//        
//        // App registers for location updates? (code from iDan: slack)
//        self.locationManager?.allowsBackgroundLocationUpdates = true
//    }
//    
//    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    //        let locations = location[0]
//    //    }
//    
//    // create fence with location, radius, and test id
//    // return fence
//    func createFence(startLocation: CLLocation, newRadius: CLLocationDistance, fenceID: String) -> CLCircularRegion {
//        //        let ourRadius = 10.0
//        //        let ourString = "test_id"
//        let fence = CLCircularRegion(
//            center: startLocation.coordinate,
//            radius: newRadius,
//            identifier: fenceID)
//        // registers region in 'monitoredRegions' property
//        locationManager?.startMonitoring(for: fence)
//        fence.notifyOnEntry = true
//        fence.notifyOnExit = true
//        return fence
//    }
//    
//    
//    
//}
