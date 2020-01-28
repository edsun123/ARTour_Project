//
//  PopUpViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 1/15/20.
//  Copyright © 2020 SeniorDesign. All rights reserved.
//

import UIKit
import Firebase

class PopUpViewController: UIViewController {

    var db: Firestore!
    @IBOutlet weak var TextField: UITextField!
    var access: String = ""
    var liveDoc: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //firestore setup
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    @IBAction func AccessCode(_ sender: Any) { //when the user clicks continue
        
        var goodDoc: Bool = false
        
        self.access = TextField.text!
        print("access = \(access)")
        
        let num = Int.random(in: 0..<25)
        print("number = \(num)")
        
        let docRef = db.collection("Tour").document("Engineering").collection("TourGroups").document("x5")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                print("Found document")
                goodDoc = true
                self.liveDoc = goodDoc
            } else {
                let alert = UIAlertController(title: "Invalid Access Code", message: "You have entered an invalid access code, please try again", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        if goodDoc == true {
            var ref: DocumentReference? = nil
            ref = db.collection("Tour").document("Engineering").collection("TourGroups").document(access).collection("Users").addDocument(data: [
                "number": num
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        print("liveDoc = \(liveDoc)")
        
        if identifier == "TourSegue"{
            if liveDoc == false {

                print("Error, can't verify document existence")
                TextField.text = ""
                return false //stop segue
            }
        }

        return true //goodDoc == true, document exists
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        // Get the new view controller using segue.destination.
//        let vc = segue.destination as! TourViewController //FIX THIS LINE
//        //when a user clicks cancel app is trying to go back but segue says go forward
//
//        // Pass the selected object to the new view controller.
//        vc.accessCode = access
//    }

}
