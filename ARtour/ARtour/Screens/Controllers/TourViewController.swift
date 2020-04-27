//
//  TourViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 11/6/19.
//  Copyright © 2019 SeniorDesign. All rights reserved.
//

import Firebase
import UIKit

class TourViewController: UIViewController {

    var accessCode: String = ""
    var docCreate: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  var window: UIWindow?
  var appCoordinator: MainCoordinator!
    
    @IBAction func PushStart(_ sender: Any) {
//        self.performSegue(withIdentifier: "AugReal", sender: self)
        window = UIWindow (frame: UIScreen.main.bounds)
        if let window = window{
            appCoordinator = MainCoordinator(window: window)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "QuestionSegue") {
            let vc = segue.destination as! QuestionsViewController // Get the view controller
            vc.codigo = self.accessCode // Pass the selected objects to the view controller
            vc.identi = self.docCreate
        }
    }

}
