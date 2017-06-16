import Vapor
import Foundation

extension Droplet {
    func setupRoutes() throws {
        
        get("hello") { req in
            return try self.view.make("Content/hello")
        }
        
        // variable
        get("time") { req in
            
            // Don't try this at home!
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            
            let timeString = dateFormatter.string(from: Date())
            
            let context = ["time": timeString]
            return try self.view.make("Content/time", context)
        }
        
        // if else
        get("age-check") { req in
            
            let age = 16
            let context = ["oldEnough": age >= 16]
            
            return try self.view.make("Content/age-check", context)
        }
        
        // loop
        get("please-buy") { req in
            let shoppingList = ["🎂", "🍺", "🍕", "🌻"]
            
            let context = ["shoppingList": shoppingList]
            
            return try self.view.make("Content/please-buy", context)
        }
    }
}
