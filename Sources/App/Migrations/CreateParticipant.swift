//
//  SwiftUIView.swift
//  
//
//  Created by Rahaf ALghuraibi on 08/08/1445 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateParticipant: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("participant")
        .id()
        .field("FirstName", .string)
        .field("LastName", .string)
        .field("Email", .string)
        .create()
    }
    
    // undo
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("planets").delete()
    }
    
    
}
