//
//  CodeViewController.swift
//  studyIOS
//
//  Created by ice ice on 12/1/20.
//

import UIKit
import FirebaseDatabase
import Firebase
import AVKit

class CodeViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Codecell")! as! CodeTableViewCell
        let imgURL = URL(string: myCourses[indexPath.row].img!)
        let data = try? Data(contentsOf: imgURL!)
        
        cell.lbCodetable.text = myCourses[indexPath.row].title
        cell.lbCodeMentor.text = myCourses[indexPath.row].mentor
        cell.lbCodeRate.text = myCourses[indexPath.row].rate
        cell.lbCodeImg.image = UIImage(data: data!)
        cell.lbCodeImg.contentMode = .scaleAspectFit
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
    
    @IBOutlet weak var CodeTableView: UITableView!
    
    var myCourses:[course] = []
    var headerVisible = true
    
    var table = [course]()
    var ref : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        CodeTableView.separatorStyle = .none
//      tableone.showsVerticalScrollIndicator = false
//      tableone.backgroundColor = UIColor.init(red: 35, green: 40, blue: 45, alpha: 1)
       
        self.CodeTableView.rowHeight = 200
        
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
                    let Img = Object?["img"] as! String
                    print(Data)
                    let video = course(link: videolink,data: Data, mentor: Mentor, rate: Rate , titles: Title,img: Img)
                    self.myCourses.append(video)
                   
                    
                }
                self.CodeTableView.reloadData()
            }
        })

        // Do any additional setup after loading the view.
    }

        // Do any additional setup after loading the view.
    
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

extension UIView {

    func CodeTableView() -> UITableView? {
        if let tableview = self as? UITableView {
            return tableview
        } else {
            return superview?.findTableView()
        }
    }

    func CodeTableViewCell() -> UITableViewCell? {
        if let cell = self as? UITableViewCell {
            return cell
        } else {
            return superview?.findTableViewCell()
        }
    }

    func CodeTableviewcellpath() -> IndexPath? {
        guard let cell = findTableViewCell(), let tableView = cell.findTableView() else { return nil }
        return tableView.indexPath(for: cell)
    }

}
