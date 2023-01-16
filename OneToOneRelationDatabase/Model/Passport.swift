//
//  Passport.swift
//  OneToOneRelationDatabase
//
//  Created by Sahid Reza on 16/01/23.
//

import Foundation

class Passport{
    
    let id:UUID
    var passportID:String?
    var placeofIssue:String?
    var name:String?
    
    init(id: UUID, passportID: String?, placeofIssue: String?, name: String? = nil) {
        self.id = id
        self.passportID = passportID
        self.placeofIssue = placeofIssue
        self.name = name
    }
    
}
