//
//  ViewController.swift
//  team-ios-koth
//
//  Created by DC, DE, DG on 5/11/17.
//  Copyright © 2017. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            
            let currentLocation = locations.first
            
            if currentLocation?.altitude != nil{
                
                testLabel.text = String(currentLocation!.altitude)
                let color = currentLocation!.altitude / 100
                
                
                testLabel.backgroundColor = UIColor.init(colorLiteralRed: Float(color), green: 0.2, blue: 0.2, alpha: 0.7)
                
                
            }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



