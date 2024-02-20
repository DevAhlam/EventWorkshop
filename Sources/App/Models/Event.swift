//
//  File.swift
//  
//
//  Created by shomokh aldosari on 08/08/1445 AH.
//

import Foundation
import Vapor
import Fluent

final class Event: Model, Content{
    static let schema = "events"
    
    @ID (key: .id)
    var id : UUID?
    
    @Field (key:"name")
    var name : String
    
    @Field (key: "eventdescription")
    var eventdescription : String
    
    @Field (key: "eventdate")
    var eventdate : String
    
    @Field (key: "eventtime")
    var eventtime : String
    

    @Parent(key: "providerID")
        var provider: EventProvider
    
    @Siblings(through: EventParticipant.self, from: \.$event, to: \.$participant)
        public var participants: [ParticipantModel]
    
    init() {}
    init (id : UUID? = nil , name : String, eventdescription : String, eventdate: String, eventtime: String, providerID: EventProvider.IDValue){
        self.id = id
        self.name = name
        self.eventdescription = eventdescription
        self.eventdate = eventdate
        self.eventtime = eventtime
        self.$provider.id = providerID
        
    }
}
