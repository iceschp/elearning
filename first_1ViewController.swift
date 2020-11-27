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

class first_1ViewController: UIViewController ,UIScrollViewDelegate {
    
    @IBOutlet weak var explore: UILabel!
    
//    var table = [english]()
//    var ref : DatabaseReference!
    
    @IBOutlet weak var homeTable: UITableView!
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return table.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "celltable")! as! homeTableViewCell
//
//        let video: english
//
//        video = table[indexPath.row]
//        cell.txtname.text = video.name
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let videoURL = URL(string: table[indexPath.row].link!) else {
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
//        }
//
//    }
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    var headerVisible = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollview.contentSize = CGSize(width: self.view.frame.width, height: 2 * self.view.frame.height)
        
//        ref = Database.database().reference().child("english")
//
//        ref.observe(DataEventType.value, with: {(snapshot) in
//            if snapshot.childrenCount > 0 {
//                self.table.removeAll()
//
//                for video in snapshot.children.allObjects as! [DataSnapshot]{
//
//                    let Object = video.value as? [String: AnyObject]
//                    let Name = Object?["name"]
//                    let videolink = Object?["link"]
//
//                    let video = english(name: Name as? String, link: videolink as? String)
//                    self.table.append(video)
//
//                    self.homeTable.reloadData()
//                }
//            }
//        })
        
    }
   
        
        func hideHeader() {
            self.headerVisible = false
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                let parent = self.parent as! ViewController
                parent.hideHeader()
            })
        }
        
        func showHeader() {
            self.headerVisible = true
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
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
