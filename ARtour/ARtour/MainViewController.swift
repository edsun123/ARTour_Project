//
//  MainViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 11/6/19.
//  Copyright © 2019 SeniorDesign. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class MainViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Request access to location
        let status = CLLocationManager.authorizationStatus()
        switch status {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            return
            
        case .denied, .restricted:
            let alert = UIAlertController(title: "Location services disabled", message: "Please enable location services in Settings", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
            
        case .authorizedAlways, .authorizedWhenInUse:
            break
            
        @unknown default:
            print("UNKNOWN ERROR")
            return
        }
        
        //Request access to bluetooth
    }

    @IBAction func FutureTour1(_ sender: Any) {

        //future tour alert
        let alert = UIAlertController(title: "Future Tour", message: "This tour is still being developed, please check back later", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func FutureTour2(_ sender: Any) {
    
        //future tour alert
        let alert = UIAlertController(title: "Future Tour", message: "This tour is still being developed, please check back later", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func FutureTour3(_ sender: Any) {
    
        //future tour alert
        let alert = UIAlertController(title: "Future Tour", message: "This tour is still being developed, please check back later", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
