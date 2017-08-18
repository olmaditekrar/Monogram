import Foundation


class UserSession {
    
    static let shared = UserSession()
    
    var usersArray: [User] = []
    
    private init() { }
    
    
}
