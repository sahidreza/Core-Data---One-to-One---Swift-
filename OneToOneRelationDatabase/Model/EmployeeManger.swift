//
//  EmployeeManger.swift
//  OneToOneRelationDatabase
//
//  Created by Sahid Reza on 16/01/23.
//

import Foundation


struct EmployeeManager {
    
    var _employeeRespostory = EmployeeDataRespoitery()
    
    
    
    func createEmployeeManger(employeeData:Employee){
        
        if (validatePassport(passport: employeeData.passport) == false){
            
            employeeData.passport = nil
            
        }else{
        
            _employeeRespostory.create(record: employeeData)
        
        }
        
       
    }
    
    private func validatePassport(passport: Passport?) -> Bool
    {
        if(passport == nil || passport?.passportID?.isEmpty == true || passport?.placeofIssue?.isEmpty == true)
        {
            return false
        }

        return true
    }
    
    
    
}
