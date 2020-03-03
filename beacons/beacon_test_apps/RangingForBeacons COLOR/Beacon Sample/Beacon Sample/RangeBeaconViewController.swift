/*
See LICENSE folder for this sample’s licensing information.

Abstract:
View controller that illustrates how to start and stop ranging for a beacon region.
*/

import UIKit
import CoreLocation

class RangeBeaconViewController: UIViewController, CLLocationManagerDelegate {
    
    
    /**
     This hardcoded UUID appears by default in the ranging prompt.
     It is the same UUID used in ConfigureBeaconViewController
     for creating a beacon.
     */
    let defaultUUID = "FF77CB88-631F-4DC4-8AA6-FB2C9E594D3A"
    
    let colors = [
        61958: UIColor(red: 0/255, green: 0/255, blue: 225/255, alpha: 1),
        61959: UIColor(red: 0/255, green: 225/255, blue: 0/255, alpha: 1),
        61957: UIColor(red: 225/255, green: 0/255, blue: 0/255, alpha: 1)
    ]

    /// This location manager is used to demonstrate how to range beacons.
    var locationManager = CLLocationManager()
    
    var beaconConstraints = [CLBeaconIdentityConstraint: [CLBeacon]]()
    var beacons = [CLProximity: [CLBeacon]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        if let uuid = UUID(uuidString: "FF77CB88-631F-4DC4-8AA6-FB2C9E594D3A") {
                       self.locationManager.requestWhenInUseAuthorization()
                       
                       // Create a new constraint and add it to the dictionary.
                       let constraint = CLBeaconIdentityConstraint(uuid: uuid)
                       self.beaconConstraints[constraint] = []
                       
                       /*
                       By monitoring for the beacon before ranging, the app is more
                       energy efficient if the beacon is not immediately observable.
                       */
                       let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: uuid.uuidString)
                       self.locationManager.startMonitoring(for: beaconRegion)
                   }

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        // Stop monitoring when the view disappears.
        for region in locationManager.monitoredRegions {
            locationManager.stopMonitoring(for: region)
        }
        
        // Stop ranging when the view disappears.
        for constraint in beaconConstraints.keys {
            locationManager.stopRangingBeacons(satisfying: constraint)
        }
    }

    
    // MARK: - Location Manager Delegate
    /// - Tag: didDetermineState
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        let beaconRegion = region as? CLBeaconRegion
        if state == .inside {
            // Start ranging when inside a region.
            manager.startRangingBeacons(satisfying: beaconRegion!.beaconIdentityConstraint)
        } else {
            // Stop ranging when not inside a region.
            manager.stopRangingBeacons(satisfying: beaconRegion!.beaconIdentityConstraint)
        }
    }
    
    /// - Tag: didRange
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        /*
         Beacons are categorized by proximity. A beacon can satisfy
         multiple constraints and can be displayed multiple times.
         */
        
        beaconConstraints[beaconConstraint] = beacons
        
        self.beacons.removeAll()
        
        var allBeacons = [CLBeacon]()
        
        for regionResult in beaconConstraints.values {
            allBeacons.append(contentsOf: regionResult)
        }
        
        for range in [CLProximity.unknown, .immediate, .near, .far] {
            let proximityBeacons = allBeacons.filter { $0.proximity == range }
            if !proximityBeacons.isEmpty {
                self.beacons[range] = proximityBeacons
                var closestBeacon: CLBeacon? = nil
                for beacon in beacons {
                  if closestBeacon == nil || (beacon.rssi > 0 && beacon.rssi < closestBeacon!.rssi) {
                    closestBeacon = beacon as CLBeacon
                  }
                }
                self.view.backgroundColor = self.colors[closestBeacon!.minor.intValue]
            }
        }
        
    }
    
    
   
    

}
