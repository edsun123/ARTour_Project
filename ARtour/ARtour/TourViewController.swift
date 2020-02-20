//
//  TourViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 11/6/19.
//  Copyright © 2019 SeniorDesign. All rights reserved.
//

import UIKit

class TourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  var window: UIWindow?
  var appCoordinator: MainCoordinator!

    
    @IBAction func StartButton(_ sender: Any) {
        window = UIWindow(frame: UIScreen.main.bounds)
//
        if let window = window {
              appCoordinator = MainCoordinator(window: window)
        }
        //user join group
        //program segue to AR
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
