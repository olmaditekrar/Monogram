import UIKit
class TabBarController: UITabBarController {
    var currentUser = User()
    var usersFromSignUp :  [User]?
    var bakalimAga = 12
    override func viewDidLoad() {
        super.viewDidLoad()
        var usersInTabBarController = [User]()
        usersInTabBarController = usersFromSignUp!
        let storyboard = UIStoryboard(name : "Main" , bundle : nil)
        let feedViewController = storyboard.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
        feedViewController.currentUser = self.currentUser
        feedViewController.bakalimNolcak = 12
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

