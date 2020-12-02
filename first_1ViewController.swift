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
    // text
    @IBOutlet weak var explore: UILabel!
    @IBOutlet weak var popular: UILabel!
    
    // table
    @IBOutlet weak var homeTable: UITableView!
    
    var myCourses:[course] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCourses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "startcell")! as! firstViewCell
        let imgURL = URL(string: myCourses[indexPath.row].img!)
        let data = try? Data(contentsOf: imgURL!)
        
        cell.lbhometable.text = myCourses[indexPath.row].title
        cell.lbMentor.text = myCourses[indexPath.row].mentor
        cell.lbRate.text = myCourses[indexPath.row].rate
        cell.lbImg.image = UIImage(data: data!)
        cell.lbImg.contentMode = .scaleAspectFit
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        guard let videoURL = URL(string: myCourses[indexPath.row].link!) else {
//            return
//        }
//
//        let player = AVPlayer(url: videoURL)
//
//        let controller = AVPlayerViewController()
//        controller.player = player
//
//        present(controller, animated: true){
//            player.play()
//      }
        
        let showView = storyboard?.instantiateViewController(identifier: "showDetail") as! detailViewController
        showView.mentor = myCourses[indexPath.row].mentor
        showView.data = myCourses[indexPath.row].data
        showView.img = myCourses[indexPath.row].img
        showView.titles = myCourses[indexPath.row].title
        showView.link = myCourses[indexPath.row].link
        
        self.present(showView, animated: true, completion: nil)
    }
    
    
    var headerVisible = true
    
    var table = [course]()
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTable.separatorStyle = .none
//      tableone.showsVerticalScrollIndicator = false
//      tableone.backgroundColor = UIColor.init(red: 35, green: 40, blue: 45, alpha: 1)
       
        self.homeTable.rowHeight = 200
        
        ref = Database.database().reference().child("coures/popular")

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
                    let Img = Object?["img"] as! String
                    print(Data)
                    let video = course(link: videolink,data: Data, mentor: Mentor, rate: Rate , titles: Title,img: Img)
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
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = (sender as? UIView)?.findTableviewcellpath() else { return }
        
//        if segue.identifier == "showDetail"{
//            let detailViewController = segue.description as! detailViewController
//            detailViewController.
        }
    }

extension UIView {

    func findTableView() -> UITableView? {
        if let tableview = self as? UITableView {
            return tableview
        } else {
            return superview?.findTableView()
        }
    }

    func findTableViewCell() -> UITableViewCell? {
        if let cell = self as? UITableViewCell {
            return cell
        } else {
            return superview?.findTableViewCell()
        }
    }

    func findTableviewcellpath() -> IndexPath? {
        guard let cell = findTableViewCell(), let tableView = cell.findTableView() else { return nil }
        return tableView.indexPath(for: cell)
    }

}

