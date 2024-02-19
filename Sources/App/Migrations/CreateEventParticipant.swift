//
//  File.swift
//  
//
//  Created by shomokh aldosari on 09/08/1445 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver


struct CreateEventParticipant: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("events")
        .id()
        .field("event_id", .uuid, .references("providerID", "id"))
        .field("provider_id", .uuid, .references("providerID", "id"))
        .create()
    }
    
    // undo
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("events").delete()
    }
    
    
}
