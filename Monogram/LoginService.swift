import Foundation
import UIKit




func loginService(username: String, password: String) -> Int{
    
    var userSession = UserSession.shared
    
    var indexOfLoop = 0
    for currentUser in userSession.usersArray{
        
        
        if (username == currentUser.username && password == currentUser.password ){
            return indexOfLoop
        }
        indexOfLoop += 1
       
    }
    return -1
    
   
        
}
