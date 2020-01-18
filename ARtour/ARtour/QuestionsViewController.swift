//
//  QuestionsViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 1/17/20.
//  Copyright © 2020 SeniorDesign. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SubmitEmail(_ sender: Any) {
        
        //save email
        //if already in database, autofill
        //saved in user's document
    }
    
    @IBAction func SubmitQuestions(_ sender: Any) {
        
        //save questions
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
