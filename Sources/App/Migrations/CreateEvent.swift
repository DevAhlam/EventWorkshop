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
        .field("name", .string)
        .field("eventdescription", .string)
        .field("eventdate", .string)
        .field("eventtime", .string)
        //.field("ProviderID", .string)
        .field("providerID", .uuid, .references("EventProvider", "id"))
        .create()
    }
    
    // undo
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("events").delete()
    }
    
    
}
