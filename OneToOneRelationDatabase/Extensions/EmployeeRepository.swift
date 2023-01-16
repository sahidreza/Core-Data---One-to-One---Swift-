//
//  EmployeeRepository.swift
//  OneToOneRelationDatabase
//
//  Created by Sahid Reza on 16/01/23.
//

import Foundation
import CoreData

protocol EmployeeRepository:BaseRepository{
    
}

struct EmployeeDataRespoitery:EmployeeRepository{
    
    typealias T = Employee
   
    func create(record: Employee) {
        
        let cdemployeData = CDEmployee(context: PersistanceStorage.shared.context)
        cdemployeData.id = record.id
        cdemployeData.name = record.name
        cdemployeData.email = record.email
        
        if (record.passport != nil){
            
            let cdPassportData = CDPassport(context: PersistanceStorage.shared.context)
            
            cdPassportData.id = record.passport?.id
            cdPassportData.passportID = record.passport?.passportID
            cdPassportData.placeOfIssue = record.passport?.placeofIssue
            
            cdemployeData.toPassport = cdPassportData
            
        }
        
        PersistanceStorage.shared.saveContext()
        
    }
    
    func getAll() -> [Employee]? {
        
        let request:NSFetchRequest<CDEmployee> = CDEmployee.fetchRequest()
        
        do{
            
            let fectchData = try PersistanceStorage.shared.context.fetch(request)
            var employeeDataList = [Employee]()
            
            fectchData.forEach { (cdEmployee) in
                
                let employeeData = Employee(id: cdEmployee.id!, name: cdEmployee.name!, email: cdEmployee.email!)
                
                employeeDataList.append(employeeData)
            }
            
            return employeeDataList
            
        }catch{
            
            return nil
        }
        
        
    }
    
    func get(byIdentifier: UUID) -> Employee? {
        let cdEmployeeData = checkingID(with: byIdentifier)
        
        if let safeData = cdEmployeeData {
            
            let employeeData = Employee(id: safeData.id!, name: safeData.name!, email: safeData.email!)
            
            return employeeData
            
        }else{
            
            return nil
        }
    }
    
    func update(record: Employee) -> Bool {
        
        if let responseData = checkingID(with: record.id){
            responseData.email = record.email
            responseData.name = record.name
            
            PersistanceStorage.shared.saveContext()
            
            return true
        }else{
            return false
        }
        
    }
    
    func delete(byIdentifier id: UUID) -> Bool {
        if let responseData = checkingID(with: id){
            
            PersistanceStorage.shared.context.delete(responseData)
            
            PersistanceStorage.shared.saveContext()
            
            return true
        }else{
            return false
        }
    }
    
    private func checkingID(with identyifierID:UUID) -> CDEmployee?{
        
        let request:NSFetchRequest<CDEmployee> = CDEmployee.fetchRequest()
        let predicate = NSPredicate(format: "id==%@", identyifierID as CVarArg)
        request.predicate = predicate
        
        do {
            
            let responseData = try PersistanceStorage.shared.context.fetch(request).first
            
            return responseData
            
        }catch{
            
            print(error)
            
            return nil
        }
        
        
    }
    
    
}
