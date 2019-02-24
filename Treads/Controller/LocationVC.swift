//
//  LocationVC.swift
//  Treads
//
//  Created by Ricardo Herrera Petit on 2/24/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import MapKit

class LocationVC: UIViewController, MKMapViewDelegate {

    var manager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.activityType = .fitness
        

    }
    
    func checkLocationAuthStatus() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            manager?.requestWhenInUseAuthorization()
        }
    }

}
