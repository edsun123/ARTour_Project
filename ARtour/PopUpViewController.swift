//
//  PopUpViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 1/15/20.
//  Copyright © 2020 SeniorDesign. All rights reserved.
//

import Firebase
import UIKit

class PopUpViewController: UIViewController, UITextFieldDelegate {

    var db: Firestore!
    @IBOutlet weak var TextField: UITextField!
    var access: String = ""
    var docID: String = ""
    var num: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //firestore setup
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        TextField.delegate = self //manage the keyboard
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func AccessCode(_ sender: Any) { //when the user clicks continue
        TextField.resignFirstResponder()
        self.access = TextField.text!
        
        if (self.access.isEmpty) {
            let alert = UIAlertController(title: "Enter an Access Code", message: "You have not entered an access code, please enter one to continue", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
            num = Int.random(in: 0..<100)
            let docRef = db.collection("Tours").document("Engineering").collection("TourGroups").document(access)
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    print("Found document")
                    var ref: DocumentReference? = nil
                    ref = self.db.collection("Tours").document("Engineering").collection("TourGroups").document(self.access).collection("Users").addDocument(data: ["number": self.num]) { err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            print("Document added with ID: \(ref!.documentID)")
                        }
                    }
                    self.TextField.text! = ""
                    self.docID = ref!.documentID
                    self.performSegue(withIdentifier: "TourSegue", sender: self)
                } else {
                    print("Could not find document")
                    let alert = UIAlertController(title: "Invalid Access Code", message: "You have entered an invalid access code, please try again", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    self.TextField.text! = ""
                }
            }
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "TourSegue") {
            let vc = segue.destination as! TourViewController // Get the view controller
            vc.accessCode = self.access // Pass the selected objects to the view controller
            vc.docCreate = self.docID
        }
    }

}
