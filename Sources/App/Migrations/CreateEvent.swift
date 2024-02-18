//
//  File.swift
//  
//
//  Created by shomokh aldosari on 08/08/1445 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateEvent: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("events")
        .id()
        .field("EventName", .string)
        .field("EventDescription", .string)
        .field("EventDate", .string)
        .field("Eventtime", .string)
        .field("ProviderID", .string)
        .create()
    }
    
    // undo
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("events").delete()
    }
    
    
}
