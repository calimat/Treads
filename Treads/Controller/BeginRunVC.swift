//
//  BeginRunVC.swift
//  Treads
//
//  Created by Ricardo Herrera Petit on 2/19/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import MapKit

class BeginRunVC: LocationVC {

    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lastRunCloseBtn: UIButton!
    @IBOutlet weak var paceLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var lastRunStack: UIStackView!
    @IBOutlet weak var lastRunBGView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuthStatus()
        mapView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        manager?.delegate = self
        manager?.startUpdatingLocation()
        getLastRun()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        manager?.stopUpdatingLocation()
    }
    
    func getLastRun() {
        guard let lastRun = Run.getAllRuns()?.first else {
            lastRunStack.isHidden = true
            lastRunBGView.isHidden = true
            lastRunCloseBtn.isHidden = true
            return
            
        }
        
        lastRunStack.isHidden = false
        lastRunBGView.isHidden = false
        lastRunCloseBtn.isHidden = false
        
        paceLbl.text = lastRun.pace.formatTimeDurationToString()
        distanceLbl.text = "\(lastRun.distance.metersToMiles(places: 2)) mi"
        durationLbl.text = lastRun.duration.formatTimeDurationToString()
        
        
    }

    @IBAction func locationCenterBtnPressed(_ sender: Any) {
    }
    
    @IBAction func lastRunCloseBtnPressed(_ sender: Any) {
        lastRunStack.isHidden = true
        lastRunBGView.isHidden = true
        lastRunCloseBtn.isHidden = true
    }
    
    
}

extension BeginRunVC : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            checkLocationAuthStatus()
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
        }
    }
}
