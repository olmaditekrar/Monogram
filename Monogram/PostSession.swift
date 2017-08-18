import Foundation
class PostSession {
    
    static let shared = PostSession()
    
    var postsArray: [Post] = []
    
    private init() { }
    
    
}
