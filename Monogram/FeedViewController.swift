import UIKit
class FeedViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    var posts = PostSession.shared
    var dummyUser : User?
    var dummyPost : Post?
    var dummyUser2 : User?
    var dummyPost2 : Post?
    var dummyPost3 : Post?
    var userSession = UserSession.shared
    var currentUser = User()
    var bakalimNolcak : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name : "Main" , bundle : nil)
        let profileViewController = storyboard.instantiateViewController(withIdentifier: "profileViewController") as! profileViewController
        profileViewController.currentUser = self.currentUser
        //Dummy post ve user tanimlamak
        dummyUser = User(username: "Elizabeth Lynch",password : "123123124", userPhoto: UIImage(named: "Elizabeth - ProfilePhoto")! , userBio : "Consumer Psychology In The Industrial And Manufacturing Equipment Marketplace" , userBackgroundPhoto : UIImage(named: "Elizabeth - Background")! )
        dummyPost = Post(postPhoto: UIImage(named: "postDonald")!, user: dummyUser!, comments: 13, likes: 2000 , map : "East Darby" , timeAgo : 23)
        
        //1...end
        //2...start
        
        dummyUser2 = User(username: "David Cooper",password : "123123124", userPhoto: UIImage(named: "David - ProfilePhoto")! , userBio : "The Idea Of God Is Not Henceforth Relevant" , userBackgroundPhoto : UIImage(named: "David - Background")! )
        dummyPost2 = Post(postPhoto: UIImage(named: "David - PostPhoto")!, user: dummyUser2!, comments: 132, likes: 200 , map : "San Fransisco" , timeAgo : 78 )
        //2...end
        //3...start
 
        dummyPost3 = Post(postPhoto: UIImage(named: "Elizabeth - PostPhoto")!, user: dummyUser!, comments: 132, likes: 200 , map : "Istanbul" , timeAgo : 198)
        
        
        
        //Dummy post ve user tanimlamak
        
        
        //Appendlemek postlari array'e
        posts.postsArray.append(dummyPost!)
        posts.postsArray.append(dummyPost2!)
        posts.postsArray.append(dummyPost3!)
     }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCellFeed") as! PostTableViewCell
        //Cell ozellıklerını ıcerı aktarmak
        cell.postImageView.image = posts.postsArray[indexPath.row].postPhoto
        cell.profilePhoto.image = posts.postsArray[indexPath.row].user.userPhoto
        cell.userNameLabel.text = posts.postsArray[indexPath.row].user.username
        cell.mapLabel.text = posts.postsArray[indexPath.row].map
        cell.timeAgoLabel.text = String(posts.postsArray[indexPath.row].timeAgo) + " time ago"
        // Cell ozelliklerini iceri aktarmak
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "feedToProfileSegue"
        {
            if let destinationVC = segue.destination as? profileViewController {
                destinationVC.currentUser = self.currentUser
                destinationVC.posts = self.posts
            }
        }
    }
}
