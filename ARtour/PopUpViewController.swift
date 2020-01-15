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
    var access = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    @IBAction func AccessCode(_ sender: Any) { //do here what happens when the user enters the access code
        
        self.access = TextField.text!
        let num = Int.random(in: 0..<25)
        let exi = verifyCode()
        
        if exi == 1 { //do here what happens when the user enters a valid access code
            
            var ref: DocumentReference? = nil
            ref = db.collection("TourGroups").document(access).collection("Users").addDocument(data: [
                "number": num
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
            
        } else { //do here what happens when the user enters an invalid access code
            print("Error tour group does not exists, please try again")
        }
    }

    func verifyCode() -> Int {

        var exs = 0
        let docRef = db.collection("TourGroups").document(access)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                exs = 1
                print("Document exists")
            } else {
                exs = -1
                print("Error document does not exist")
            }
        }
        
        return exs
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
