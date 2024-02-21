import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.databases.use(.postgres(configuration: SQLPostgresConfiguration(hostname: "localhost",  username: "postgres", password:"", database: "eventdb" ,tls: .prefer(try .init(configuration: .clientDefault)))), as: .psql)
    // register routes
    app.migrations.add(CreateEventProvider())
    app.migrations.add(CreateEvent())
    app.migrations.add(CreateParticipant())
    app.migrations.add(CreateEventParticipant())
    
    try app.register(collection: EventController())
    try app.register(collection: Eventprovider())
    try app.register(collection: Participant())
    
    try routes(app)
}
