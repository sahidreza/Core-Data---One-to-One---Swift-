//
//  Employee.swift
//  OneToOneRelationDatabase
//
//  Created by Sahid Reza on 16/01/23.
//

import Foundation

class Employee{
    
    let id:UUID
    let name,email:String
    var passport:Passport?
    
    init(id: UUID, name: String, email: String, passport: Passport? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.passport = passport
    }
    
    
}
