//
//  File.swift
//  
//
//  Created by shomokh aldosari on 09/08/1445 AH.
//

import Foundation
import Vapor
import Fluent
// plant = event , star = provider


// Example of a pivot model.
final class EventParticipant: Model {
    static let schema = "events"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "event_id")
    var event: Event

    @Parent(key: "provider_id")
    var provider: EventProvider

    

    init() { }

    init(id: UUID? = nil, event: Event, provider: EventProvider) throws {
        self.id = id
        self.$event.id = try event.requireID()
        self.$provider.id = try provider.requireID()
        
    }
}
