import UIKit
class signUpViewController: UIViewController {
    //New User
    var newUser = User()
    var userSession = UserSession.shared
    //Users Stored Data Set .

    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var rePasswordLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    @IBAction func signUpButton(_ sender: Any) {
        var usernameInfo = usernameLabel.text
        var passwordInfo = passwordLabel.text
        var repassInfo = rePasswordLabel.text
        if repassInfo != passwordInfo{
            warningLabel.text = "Passwords don't match !"
        }
        else{
            warningLabel.text = ""
            //We are checking , If the userInfo has been deployed before.
            for currentUserIndex in userSession.usersArray
            {
                if (currentUserIndex.username == usernameInfo){
                    warningLabel.text = "Username has already taken."
                    break
                }
            }
            if (warningLabel.text != "Username has already taken."){
               
                
                newUser = User(username: usernameInfo!,password : passwordInfo!, userPhoto: UIImage(named: "Elizabeth - ProfilePhoto")! , userBio : "Consumer Psychology In The Industrial And Manufacturing Equipment Marketplace" , userBackgroundPhoto : UIImage(named: "Elizabeth - Background")! )
                // Add newUser variable to the array of Users.
                userSession.usersArray.append(newUser)
                let storyboard = UIStoryboard(name : "Main" , bundle : nil)
              // profileViewController.currentUserProfile.userPhoto = newUser.userPhoto
                let profileViewController = storyboard.instantiateViewController(withIdentifier: "profileViewController") as! profileViewController
                let feedViewController = storyboard.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
                feedViewController.currentUser = newUser
               // profileViewController.currentUser = newUser
                // profileViewController.users = self.users
                present(feedViewController, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
