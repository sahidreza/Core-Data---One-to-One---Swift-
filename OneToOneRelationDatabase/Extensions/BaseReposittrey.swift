//
//  BaseReposittrey.swift
//  OneToOneRelationDatabase
//
//  Created by Sahid Reza on 16/01/23.
//

import Foundation 

protocol BaseRepository{
    
    associatedtype T
    
       func create(record:T)
       func getAll() ->[T]?
       func get(byIdentifier:UUID) -> T?
       func update(record:T) -> Bool
       func delete(byIdentifier id: UUID) -> Bool
    
}
