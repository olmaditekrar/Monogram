import UIKit

class User {
    var username : String
    var password : String
    var userPhoto : UIImage?
    var userBio : String
    var userBackgroundPhoto : UIImage?
    init(username : String ,password : String, userPhoto : UIImage , userBio : String , userBackgroundPhoto : UIImage) {
        self.username = username
        self.userPhoto = userPhoto
        self.password = password
        self.userBio = userBio
        self.userBackgroundPhoto = userBackgroundPhoto
    }
    init() {
        username = ""
        password = ""
        userBio = ""
    }
}
