//
//  QuestionsViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 1/17/20.
//  Copyright © 2020 SeniorDesign. All rights reserved.
//

import Firebase
import UIKit

class QuestionsViewController: UIViewController, UITextFieldDelegate {

    var db: Firestore!
    @IBOutlet weak var Questions: UITextField!
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
        
        Questions.delegate = self
        
        //display alert letting user know to also submit email
        let alert = UIAlertController(title: "Submit Email", message: "Don't forget to also submit your email address to receive answers to your questions!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil) //display an alert
    }
        
    @IBAction func SubmitQuestions(_ sender: Any) {
        Questions.resignFirstResponder() //get rid of keyboard
        self.questions = Questions.text! //get the questions
        if (self.questions.isEmpty) { //if no question is asked
            let alert = UIAlertController(title: "No Question", message: "You have not asked a question", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil) //display an alert
        } else { //if there is a question asked
            //save it in user's document
            var ref: DocumentReference? = nil
            ref = db.collection("Tours").document("Engineering").collection("TourGroups").document(self.codigo).collection("Users").document(self.identi).collection("Questions").addDocument(data: ["quesiton": self.questions]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                    let alert = UIAlertController(title: "Error Saving Questions", message: "There was an error saving your questions. Please try again. If problems persist, please speak with someone at the front desk in ERB 107", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                    //popup saying question received
                    let alert = UIAlertController(title: "Question Saved", message: "Your question has been recorded.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            Questions.text! = "" //clear everytime
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "EmailSegue") {
            let vc = segue.destination as! EmailViewController // Get the view controller
            vc.code = self.codigo // Pass the selected objects to the view controller
            vc.id = self.identi
        }
    }
}
