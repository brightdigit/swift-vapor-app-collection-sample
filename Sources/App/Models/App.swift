import FluentPostgreSQL
import Vapor

/// A single entry of a Todo list.
final class App: PostgreSQLUUIDModel {
    /// The unique identifier for this `Todo`.
    var id: UUID?

    /// A title describing what this `Todo` entails.
    var name: String

    /// Creates a new `Todo`.
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension App: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension App: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension App: Parameter { }
