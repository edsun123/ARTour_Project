//
//  EmailViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 2/25/20.
//  Copyright © 2020 SeniorDesign. All rights reserved.
//

import Firebase
import UIKit

class EmailViewController: UIViewController, UITextFieldDelegate {

    var db: Firestore!
    @IBOutlet weak var EmailText: UITextField!
    var email = ""
    var code = ""
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        //autofill email if it already exists
        
        EmailText.delegate = self
    }
    
    @IBAction func SubmitEmail(_ sender: Any) {
        EmailText.resignFirstResponder()
        self.email = EmailText.text! //get email
        if (self.email.isEmpty) {
            let alert = UIAlertController(title: "No Email", message: "You have not yet provided an email address", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
            //save it in user's document
            let docRef = db.collection("Tours").document("Engineering").collection("TourGroups").document(self.code).collection("Users").document(self.id)
            docRef.updateData(["email": self.email]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                    let alert = UIAlertController(title: "Error Saving Email", message: "There was an error saving your email address. Please try again. If problems persist, please speak with someone at the front desk in ERB 107", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    print("Document successfully updated")
                    let alert = UIAlertController(title: "Email Saved", message: "Your email address has been recorded. Answers to your questions will be sent to this address.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
