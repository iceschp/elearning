//
//  first_1ViewController.swift
//  studyIOS
//
//  Created by _MILK_ on 18/11/2563 BE.
//

import UIKit
import FirebaseDatabase
import Firebase
import AVKit

class first_1ViewController: UIViewController ,UIScrollViewDelegate ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var explore: UILabel!
    @IBOutlet weak var popular: UILabel!
    
    @IBOutlet weak var homeTable: UITableView!
    var myCourses:[course] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return myCourses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "startcell")! as! firstViewCell
        
        cell.lbhometable.text = myCourses[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let videoURL = URL(string: myCourses[indexPath.row].link!) else {
            return
        }

        let player = AVPlayer(url: videoURL)

        let controller = AVPlayerViewController()
        controller.player = player

        present(controller, animated: true){
            player.play()
        }

    }
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    var headerVisible = true
    
    var table = [course]()
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTable.separatorStyle = .none
//               tableone.showsVerticalScrollIndicator = false
//               tableone.backgroundColor = UIColor.init(red: 35, green: 40, blue: 45, alpha: 1)
       
             self.homeTable.rowHeight = 200
        
        scrollview.contentSize = CGSize(width: self.view.frame.width, height: 2 * self.view.frame.height)
        
        ref = Database.database().reference().child("coures/code")

        ref.observe(DataEventType.value, with: {(snapshot) in
            
            if snapshot.childrenCount > 0 {
                self.table.removeAll()

                for firCourse in snapshot.children.allObjects as! [DataSnapshot]{

                    let Object = firCourse.value as? [String: AnyObject]
                    
                    let Mentor = Object?["mentor"] as! String
                    let videolink = Object?["link"] as! String
                    let Data = Object?["data"] as! String
                    let Rate = Object?["rate"] as! String
                    let Title = Object?["title"] as! String
                    print(Data)
                    let video = course(link: videolink,data: Data, mentor: Mentor, rate: Rate , title: Title)
                    self.myCourses.append(video)
                   
                    
                }
                self.homeTable.reloadData()
            }
        })
        
    }
   
        
        func hideHeader() {
            self.headerVisible = false
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                let parent = self.parent as! ViewController
                parent.hideHeader()
            })
        }
        
        func showHeader() {
            self.headerVisible = true
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                let parent = self.parent as! ViewController
                parent.showHeader()
            })
        }
    }


extension first_1ViewController{
    
    func scrollViewDidScroll(_ scrollview: UIScrollView) {
        let translation = scrollview.panGestureRecognizer.translation(in: scrollview.superview)
        performHeaderCheck(translation: translation)
    }
    
    func performHeaderCheck(translation:CGPoint) {
        if translation.y == 0 { return }
        if translation.y > 0 {
            // Scroll Down
            if !headerVisible {
                showHeader()
            }
        } else {
            // Scroll Up
            if headerVisible {
                hideHeader()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
