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
    static let schema = "eventparticipants"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "event_id")
    var event: Event

    @Parent(key: "participant_id")
        var participant: ParticipantModel

    

    init() { }

    init(id: UUID? = nil, event: Event, participant: ParticipantModel) throws {
        self.id = id
        self.$event.id = try event.requireID()
        self.$participant.id = try participant.requireID()
        
    }
}
