//
//  ViewController.swift
//  OneToOneRelationDatabase
//
//  Created by Sahid Reza on 16/01/23.
//

import UIKit
import CoreData

class CreateEmployeeViewController: UIViewController {
    
    @IBOutlet weak var enterYourName: UITextField!
    
    @IBOutlet weak var enterYourEmailID: UITextField!
    
    @IBOutlet weak var enterYourPasspaortID: UITextField!
    
    
    @IBOutlet weak var enterYourPassportPlace: UITextField!
    
    var employeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
    }

    @IBAction func createEmpButtonPressed(_ sender: UIButton) {
        
        let passportData = Passport(id: UUID(), passportID: enterYourPasspaortID.text!, placeofIssue: enterYourPassportPlace.text!)
        let employeeData = Employee(id: UUID(), name: enterYourName.text!, email: enterYourEmailID.text!,passport: passportData)
        
        employeeManager.createEmployeeManger(employeeData: employeeData)
        
        
    }
    
}

