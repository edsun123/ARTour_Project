//
//  QuestionsViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 1/17/20.
//  Copyright © 2020 SeniorDesign. All rights reserved.
//

import UIKit
import Firebase

class QuestionsViewController: UIViewController {

    var db: Firestore!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Questions: UITextField!
    var email = ""
    var questions = ""
    var codigo: String = ""
    var identi: String = ""

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //firestore setup
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        //if email already in database, autofill
    }
    
    @IBAction func SubmitEmail(_ sender: Any) {
        
        //get email
        self.email = Email.text!
        
        //save it in user's document
        let docRef = db.collection("Tours").document("Engineering").collection("TourGroups").document(self.codigo).collection("Users").document(self.identi)
        docRef.updateData(["email": self.email]) { err in

            if let err = err {
                print("Error updating document: \(err)")
                let alert = UIAlertController(title: "Error Saving Email", message: "There was an error saving your email address. Please try again. If problems persist, please speak with someone at the front desk in ERB 107", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default) {
                    (action:UIAlertAction) in
                }

                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)

            } else {
                print("Document successfully updated")
                
                let alert = UIAlertController(title: "Email Saved", message: "Your email address has been recorded. Answers to your questions will be sent to this address.", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default) {
                    (action:UIAlertAction) in
                }

                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func SubmitQuestions(_ sender: Any) {
        
        //get the questions
        self.questions = Questions.text!
        print("questions = \(questions)")
        
        //save it in user's document
        var ref: DocumentReference? = nil
        ref = db.collection("Tours").document("Engineering").collection("TourGroups").document(self.codigo).collection("Users").document(self.identi).collection("Questions").addDocument(data: ["quesiton": self.questions]) { err in

            if let err = err {
                print("Error adding document: \(err)")
                let alert = UIAlertController(title: "Error Saving Questions", message: "There was an error saving your questions. Please try again. If problems persist, please speak with someone at the front desk in ERB 107", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default) {
                    (action:UIAlertAction) in
                }

                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)

            } else {
                print("Document added with ID: \(ref!.documentID)")
                
                //popup saying question received
                let alert = UIAlertController(title: "Question Saved", message: "Your question has been recorded.", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default) {
                    (action:UIAlertAction) in
                }

                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        Questions.text! = "" //clear everytime
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
