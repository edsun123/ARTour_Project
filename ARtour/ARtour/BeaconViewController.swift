//
//  BeaconViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 2/20/20.
//  Copyright © 2020 SeniorDesign. All rights reserved.
//

import CoreLocation
import Firebase
import UIKit

class BeaconViewController: UIViewController, CLLocationManagerDelegate {

    let defaultUUID = "FF77CB88-631F-4DC4-8AA^-FB2C9E594D3A"
    let colors = [
        61957: UIColor(red: 225/255, green: 0/255, blue: 0/255, alpha: 1),
        61958: UIColor(red: 0/255, green: 225/255, blue: 0/255, alpha: 1),
        61959: UIColor(red: 0/255, green: 0/255, blue: 225/255, alpha: 1)
    ] //7 = red, 8 = green, 9 = blue
    
    var locationManager = CLLocationManager()
    var beaconConstraints = [CLBeaconIdentityConstraint: [CLBeacon]]()
    var beacons = [CLProximity: [CLBeacon]]()

    //var db: Firestore!
    //@IBOutlet weak var Label: UILabel!
    //@IBOutlet weak var LabelTwo: UILabel!
    //var stops = ["UndergradOffice", "ImagineeringLab", "Ingalls", "BMEdept", "MEdept", "ECEdept", "EPIC", "Statistics"]
    //var pickStop = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        
        //firestore setup
        //let settings = FirestoreSettings()
        //Firestore.firestore().settings = settings
        //db = Firestore.firestore()
        
        //pickStop = Int.random(in: 1..<8)
        //let stop = stops[pickStop]
        //self.LabelTwo.text = stop
        
        //let docRef = db.collection("Tours").document("Engineering").collection("Beacons").document(stop)
        //docRef.getDocument { (document, error) in
            //if let document = document, document.exists {
                //let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                //print("Document data: \(dataDescription)")
                //self.Label.text = dataDescription
            //} else {
                //print("Document does not exist")
                //self.Label.text = "Document does not exist"
            //}
        //}
        
        //self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        //showAnimate()
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
    
    //@IBAction func closePopView(_ sender: Any) {
        //removeAnimate()
        //self.view.removeFromSuperview()
    //}
    
    //func showAnimate() {
        //self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        //self.view.alpha = 0.0;
        //UIView.animate(withDuration: 0.25, animations: {
            //self.view.alpha = 1.0
            //self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        //});
    //}
    
    //func removeAnimate() {
        //UIView.animate(withDuration: 0.25, animations: {
            //self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            //self.view.alpha = 0.0;
            //}, completion:{(finished : Bool)  in
                //if (finished)
                //{
                    //self.view.removeFromSuperview()
                //}
        //});
    //}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
