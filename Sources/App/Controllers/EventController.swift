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
        events.post(use : create)
        events.put(":id" , use : update)
        events.delete(":id" , use : delete)
        
    }
    
    func index (req : Request) async throws -> String{
        return "Get all events"
    }
    func create (req : Request) async throws -> String{
        return "Create all plants"
    }
    
    func update (req : Request) async throws -> String{
        let id = req.parameters.get("id")!
        return "Update all plants with \(id)"
    }
    func delete (req : Request) async throws -> String{
        let id = req.parameters.get("id")!
        return "Delete all plants with \(id)"
    }
    
}
