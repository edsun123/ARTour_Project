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
    var email = ""
    @IBOutlet weak var Questions: UITextField!
    var questions = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //firestore setup
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    @IBAction func SubmitEmail(_ sender: Any) {
        
        //save email
        self.email = Email.text!
        print("email = \(email)")
        
        //if already in database, autofill
        //saved in user's document
    }
    
    @IBAction func SubmitQuestions(_ sender: Any) {
        
        //save questions
        self.questions = Questions.text!
        print("questions = \(questions)")
        
        //can submit as many as they want
        //clear everytime user hits submit
        //questions collection from user, new document for every question
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
