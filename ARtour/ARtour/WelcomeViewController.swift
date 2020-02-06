//
//  WelcomeViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 1/17/20.
//  Copyright © 2020 SeniorDesign. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "MainSegue", sender: self)
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
