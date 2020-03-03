//
//  BeaconDistanceTableViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 3/3/20.
//  Copyright © 2020 SeniorDesign. All rights reserved.
//

import CoreLocation
import UIKit

class BeaconDistanceTableViewController: UITableViewController, CLLocationManagerDelegate {

    @IBOutlet var myTV: UITableView!
    let defaultUUID = "FF77CB88-631F-4DC4-8AA6-FB2C9E594D3A"
    var locationManager = CLLocationManager()
    var beaconConstraints = [CLBeaconIdentityConstraint: [CLBeacon]]()
    var beacons = [CLProximity: [CLBeacon]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
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
            }
        }
        tableView.reloadData()
    }

    // MARK: - Table view data source

    func myTV(_ myTV: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String?
        let sectionKeys = Array(beacons.keys)
        // The table view displays beacons by proximity.
        let sectionKey = sectionKeys[section]
        switch sectionKey {
            case .immediate:
                title = "Immediate"
            case .near:
                title = "Near"
            case .far:
                title = "Far"
            default:
                title = "Unknown"
        }
        return title
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return beacons.count
    }

    func myTV(_ myTV: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(beacons.values)[section].count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
