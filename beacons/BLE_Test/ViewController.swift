//
//  ViewController.swift
//  BLE_Test
//
//  Created by Sebastian Nevarez on 1/28/20.
//  Copyright © 2020 Sebastian Nevarez. All rights reserved.
//
// BEACON REFERENCES:
// https://willd.me/posts/getting-started-with-ibeacon-a-swift-tutorial
// https://developer.apple.com/documentation/corelocation/ranging_for_beacons

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(uuid: UUID(uuidString: "FDA50639-A4E2-AFCF-C6EB07647825")!, identifier: "ARTour")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self;
        locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeacons(in: region)
        
        func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
            print(beacons)
        }
    }


}

