import UIKit

class signInViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    var userSession = UserSession.shared
    var currentUser  = User()
    var userIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func signInButtonPressed(_ sender: Any) {
        let usernameInfo = usernameTextField.text
        let passwordInfo = passwordTextField.text
        userIndex = loginService(username: usernameInfo!, password: passwordInfo!)
        if userIndex != -1 {
            currentUser = userSession.usersArray[userIndex]
            print("Giris Basarili ...")
            let storyboard = UIStoryboard(name : "Main" , bundle : nil)
            let feedViewController = storyboard.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
            feedViewController.currentUser = currentUser
            present(feedViewController, animated: true, completion: nil)
            warningLabel.text = ""
        }
        else {
            warningLabel.text = "Username or password is wrong ."
            print("Giris Hatali ...")
        }
        
       
        
        
        
        
        
        
        
        
        
        
    
    }
}
