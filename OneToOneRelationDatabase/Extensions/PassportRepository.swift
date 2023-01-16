//
//  PassportRepository.swift
//  OneToOneRelationDatabase
//
//  Created by Sahid Reza on 16/01/23.
//

import Foundation
import CoreData

protocol PassportResposetry:BaseRepository{
    
}

struct PassportDataReposetry:PassportResposetry{
    
    typealias T = Passport
    
    
    func create(record: Passport) {
        
        let cdPassport = CDPassport(context: PersistanceStorage.shared.context)
        cdPassport.id = record.id
        cdPassport.passportID = record.passportID
        cdPassport.placeOfIssue = record.placeofIssue
        PersistanceStorage.shared.saveContext()
        
    }
    
    func getAll() -> [Passport]? {
        
        let request:NSFetchRequest<CDPassport> = CDPassport.fetchRequest()
        
        do{
            
            let fectchData = try PersistanceStorage.shared.context.fetch(request)
            var passportDataList = [Passport]()
            
            fectchData.forEach { (cdPassport) in
                
                let passportData = Passport(id: cdPassport.id!, passportID: cdPassport.passportID, placeofIssue: cdPassport.placeOfIssue)
                passportDataList.append(passportData)
            }
            
            return passportDataList
            
        }catch{
            
            return nil
        }
    }
    
    func get(byIdentifier: UUID) -> Passport? {
        let cdPassportData = checkingID(with: byIdentifier)
        
        if let safeData = cdPassportData {
            
            let passportData = Passport(id: safeData.id!, passportID: safeData.passportID, placeofIssue: safeData.placeOfIssue)
            
            
            
            return passportData
            
        }else{
            
            return nil
        }
        
    }
    
    func update(record: Passport) -> Bool {
        
        if  let cdpassportData = checkingID(with: record.id){
            
            cdpassportData.placeOfIssue = record.placeofIssue
            
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
    
    private func checkingID(with identyifierID:UUID) -> CDPassport?{
        
        let request:NSFetchRequest<CDPassport> = CDPassport.fetchRequest()
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
