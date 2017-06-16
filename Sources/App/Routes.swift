import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            return try self.view.make("hello")
        }
    }
}
