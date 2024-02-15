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
        
      
        
        Eventprovider.get(use : showEvent)
        
        
        Eventprovider.post(use : CreateNewEvent)
        
        
        Eventprovider.put(use: updateEventID)
      
        
        
        
        func showEvent (req : Request) async throws  -> String {
            
            return "Show all Event"
        }
        
        
        func CreateNewEvent (req : Request) async throws  -> String {
            
            return "create New Event"
        }
        
        func updateEventID (req : Request) async throws  -> String {
           
            return "update Event"
        }
       
        
     
        
        
    }

    
    
    
}

