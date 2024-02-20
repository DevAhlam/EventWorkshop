//
//  SwiftUIView.swift
//  
//
//  Created by Rahaf ALghuraibi on 08/08/1445 AH.
//
 
import Foundation
import Fluent
import Vapor

final class ParticipantModel: Model, Content {
    
    static let schema = "participant"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "FirstName")
    var FirstName: String
    @Field(key: "LastName")
    var LastName: String
    @Field(key: "Email")
    var Email: String
    
//    @Parent(key: "event_id")
//        var event: Event
    
    @Siblings(through: EventParticipant.self, from: \.$participant, to: \.$event)
        public var eventsP: [Event]
    
    init() {}
    
    init(id: UUID? = nil, FirstName: String , LastName : String, Email : String ) {
        self.id = id
        self.FirstName = FirstName
        self.LastName = LastName
        self.Email = Email
    }
    
}
