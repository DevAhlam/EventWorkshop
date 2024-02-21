//
//  SwiftUIView.swift
//  
//
//  Created by Rahaf ALghuraibi on 05/08/1445 AH.
//

import Foundation
import Vapor

struct Participant : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let Participant = routes.grouped("Participant")
        Participant.get(use: index)
        Participant.post(use : create)
      //Participant.put(":id" , use : update)
        Participant.delete(":id" , use : delete)
        
    }
    
    
    func index(req: Request) async throws -> [ParticipantModel] {
        try await ParticipantModel.query(on: req.db).all()
    }
    func create(req: Request) async throws -> ParticipantModel {
        let participant = try req.content.decode(ParticipantModel.self)
        try await participant.save(on: req.db)
        return participant
    }
    // اعتقد مافي داعي للتحدييث
//    func update (req : Request) async throws -> String{
//        let id = req.parameters.get("id")!
//        return "Update all plants with \(id)"
//    }
    func delete(req: Request) async throws -> HTTPStatus {
          guard let participant = try await ParticipantModel.find(req.parameters.get("id"), on: req.db) else {
              throw Abort(.notFound)
          }
          try await participant.delete(on: req.db)
          return .ok
      }
    
}
