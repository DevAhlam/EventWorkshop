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
      //  Participant.put(":id" , use : update)
        Participant.delete(":id" , use : delete)
        
    }
    
    func index (req : Request) async throws -> String{
        return "Get  Participant"
    }
    func create (req : Request) async throws -> String{
        return "Create  Participant"
    }
    // اعتقد مافي داعي للتحدييث
//    func update (req : Request) async throws -> String{
//        let id = req.parameters.get("id")!
//        return "Update all plants with \(id)"
//    }
    func delete (req : Request) async throws -> String{
        let id = req.parameters.get("id")!
        return "Delete all event with \(id)" //فكرت انو يحذف كل الوركشوبز اللي مسجل فيها
    }
    
}
