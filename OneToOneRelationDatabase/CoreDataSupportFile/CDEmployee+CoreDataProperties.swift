//
//  CDEmployee+CoreDataProperties.swift
//  OneToOneRelationDatabase
//
//  Created by Sahid Reza on 16/01/23.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var toPassport: CDPassport?

}

extension CDEmployee : Identifiable {

}
