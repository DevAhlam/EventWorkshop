//
//  File.swift
//  
//
//  Created by Ahlamalmutiri on 09/08/1445 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateEventProvider : Migration {
   
    
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("EventProvider")
            .id()
            .field("name", .string)
            .field("email", .string)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("EventProvider").delete()
    }
    
    
}
