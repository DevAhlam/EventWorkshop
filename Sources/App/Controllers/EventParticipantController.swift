//
//  File.swift
//  
//
//  Created by shomokh aldosari on 11/08/1445 AH.
//

import Foundation


import Vapor

struct EventParticipantController : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let eventparticipants = routes.grouped("eventparticipants")
        eventparticipants.get(use: index)
        eventparticipants.post(use : create)

       
        
    }
    
    func index(req: Request) async throws -> [EventParticipant] {
            try await EventParticipant.query(on: req.db).all()
        }
    
    
    func create(req: Request) async throws -> EventParticipant {
        let eventparticipant = try req.content.decode(EventParticipant.self)
        guard let event = try await Event.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        guard let participant = try await ParticipantModel.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        try await event.$participants.attach(participant, on: req.db)
           return eventparticipant
        }
    
    
    
}
