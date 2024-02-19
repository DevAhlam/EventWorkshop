//
//  File.swift
//  
//
//  Created by Ahlamalmutiri on 09/08/1445 AH.
//
import Foundation
import Fluent
import Vapor


final class EventProvider : Model , Content {
    
    static let schema = "EventProvider"
    
    @ID(key: .id)
    var id : UUID?
    
    @Field(key: "name")
    var name : String
    
    @Field(key: "email")
    var email : String
    
    @Children(for: \.$provider)
        var events: [Event]
    
    @Siblings(through: EventParticipant.self, from: \.$provider, to: \.$event)
        public var eventsP: [Event]
    
    
    init(){}
    
    init(id: UUID? = nil , name: String , email : String ){
        
        self.id = id
        self.name = name
        self.email = email
    }
    
    
}
