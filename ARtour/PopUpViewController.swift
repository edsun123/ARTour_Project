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
    var exs = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //firestore setup
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    @IBAction func AccessCode(_ sender: Any) { //when the user clicks continue
        
        self.access = TextField.text!
        print("access = \(access)")
        
        verifyCode()
        
        if exs == 1 { //add user to the tour group in firestore
            
            let num = Int.random(in: 0..<25)
            
            var ref: DocumentReference? = nil
            ref = db.collection("Tour").document(access).collection("Users").addDocument(data: [
                "number": num
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
            
        } else { //trigger alert letting user know they entered a bad access code

            print("Error tour group does not exists")
            
            let alert = UIAlertController(title: "Invalid Access Code", message: "You have entered an invalid access code. Please try again", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                self.TextField.text = ""
            }
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func verifyCode() { //function to verify the user input access code

        let docRef = db.collection("Tour").document(access)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                print("Document exists")
            } else {
                self.exs = 0
                print("Error document does not exist")
            }
        }
        
        print("exs = \(self.exs)")
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
