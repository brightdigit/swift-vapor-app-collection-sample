import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class AppController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[App]> {
        return App.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<App> {
        return try req.content.decode(App.self).flatMap { app in
            return app.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(App.self).flatMap { app in
            return app.delete(on: req)
        }.transform(to: .ok)
    }
}
