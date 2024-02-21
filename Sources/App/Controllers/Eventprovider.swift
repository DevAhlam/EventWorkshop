//
//  File.swift
//  
//
//  Created by Ahlamalmutiri on 05/08/1445 AH.
//

import Foundation
import Vapor



struct Eventprovider : RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        
        let Eventprovider = routes.grouped("Eventprovider")
        
        
        Eventprovider.get(use : showEvent) // all name and email
        Eventprovider.post(use : CreateNewEvent) // create new Eventprovider
        Eventprovider.delete(":id" , use : delete)
        
        
        
        func showEvent(req: Request) async throws -> [EventProvider] {
            try await EventProvider.query(on: req.db).all()
        }
        
        func CreateNewEvent(req: Request) async throws -> EventProvider {
            let EventProvider = try req.content.decode(EventProvider.self)
            try await EventProvider.save(on: req.db)
            return EventProvider
        }
        
        
        
        func delete(req: Request) async throws -> HTTPStatus {
            guard let EventProvider = try await EventProvider.find(req.parameters.get("id"), on: req.db) else {
                throw Abort(.notFound)
            }
            try await EventProvider.delete(on: req.db)
            return .ok
        }
    }
}
    
    
        
        
        
       
        
     
        
        
   

    
    
    


