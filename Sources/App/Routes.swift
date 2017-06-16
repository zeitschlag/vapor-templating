import Vapor
import Foundation

extension Droplet {
    func setupRoutes() throws {
        
        get("hello") { req in
            return try self.view.make("hello")
        }
        
        // variable
        get("time") { req in
            
            // Don't try this at home!
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            
            let timeString = dateFormatter.string(from: Date())
            
            let context = ["time": timeString]
            return try self.view.make("time", context)
        }
    }
}
