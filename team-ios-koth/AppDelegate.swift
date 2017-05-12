//
//  AppDelegate.swift
//  team-ios-koth
//
//  Created by DE on 5/11/17.
//  Copyright © 2017 DE. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let locationManager = CLLocationManager()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        return true
    }


}

// allows app to notify user while backgrounded - AppDelegate handles 'app state'
extension AppDelegate: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion){
        print("entered fence")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion){
        print("exited fence")
    }
}
