
import Foundation
import UIKit
class Post  {
    var postPhoto : UIImage
    var user : User
    var comments : Int
    var likes : Int
    var timeAgo : Int
    var map : String
    init(postPhoto : UIImage , user : User , comments : Int , likes : Int , map : String , timeAgo : Int) {
        self.postPhoto = postPhoto
        self.user = user
        self.comments = comments
        self.likes = likes
        self.timeAgo = timeAgo
        self.map = map
    }
    
    
}
