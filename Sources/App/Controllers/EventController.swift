//
//  File.swift
//  
//
//  Created by shomokh aldosari on 05/08/1445 AH.
//

import Foundation
import Vapor

struct EventController : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let events = routes.grouped("events")
        events.get(use: index)
        events.post( use : create)
//        events.put(":id" , use : update)
//        events.delete(":id" , use : delete)
        events.group(":id") { event in
            event.get(use: show)
            event.put(use: update)
            event.delete(use: delete)
                }
        
    }
    
    func index(req: Request) async throws -> [Event] {
            try await Event.query(on: req.db).all()
        }
    
    func create(req: Request) async throws -> Event {
            let event = try req.content.decode(Event.self)

            try await event.save(on: req.db)
            return event
        }
    
    
    func show(req: Request) async throws -> Event {
           guard let event = try await Event.find(req.parameters.get("id"), on: req.db) else {
               throw Abort(.notFound)
           }
           return event
       }
    
    func update(req: Request) async throws -> Event {
           guard let event = try await Event.find(req.parameters.get("id"), on: req.db) else {
               throw Abort(.notFound)
           }
           let updatedEvent = try req.content.decode(Event.self)
           event.name = updatedEvent.name
           try await event.save(on: req.db)
           return event
       }
    
    func delete(req: Request) async throws -> HTTPStatus {
            guard let event = try await Event.find(req.parameters.get("id"), on: req.db) else {
                throw Abort(.notFound)
            }
            try await event.delete(on: req.db)
            return .ok
        }
    
}

