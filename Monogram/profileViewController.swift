import UIKit
class profileViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    //Current User
    var currentUser = User()
    //All Users
    var userSession = UserSession.shared
    var posts = PostSession.shared
    var postsOfCurrentUser : [Post] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //Setting the View
        usernameLabel.text = currentUser.username
        profiePhoto.image = currentUser.userPhoto
        profilePhotoBackground.image = currentUser.userBackgroundPhoto
        bioLabel.text = currentUser.userBio
        //End of Setting the View
        print(currentUser.password)
        for postsIndex in posts.postsArray{
            if postsIndex.user.username == "Elizabeth Lynch"{
                print("This is me ! :\(postsIndex.user.username)")
                postsOfCurrentUser.append(postsIndex)
            }
            else {
                print("This is not me :( :\(postsIndex.user.username)")
            }
            
        }
        
        
        
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCellProfile") as! profilePostTableViewCell
        //Cell ozellıklerını ıcerı aktarmak
        cell.postPhotoImageView.image = postsOfCurrentUser[indexPath.row].postPhoto
        cell.profilePhotoImageView.image = postsOfCurrentUser[indexPath.row].user.userPhoto
        cell.usernameLabel.text = postsOfCurrentUser[indexPath.row].user.username
        cell.mapLabel.text = postsOfCurrentUser[indexPath.row].map
        cell.timeAgoLabel.text = String(postsOfCurrentUser[indexPath.row].timeAgo) + " time ago"
        // Cell ozelliklerini iceri aktarmak
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileToFeedSegue"
        {
                var destinationVC = segue.destination as? FeedViewController
                destinationVC?.currentUser = self.currentUser
            
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profilePhotoBackground: UIImageView!
    @IBOutlet weak var profiePhoto: UIImageView!
}
