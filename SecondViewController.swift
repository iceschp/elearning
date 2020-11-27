//
//  SecondViewController.swift
//  CustomTabBar
//
//  Created by Mehul on 06/12/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import AVKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableone: UITableView!
    
    var table = [english]()
    var ref : DatabaseReference!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellone")! as! homeTableViewCell
        
        let video: english
        
        video = table[indexPath.row]
        cell.txtname.text = video.name
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let videoURL = URL(string: table[indexPath.row].link!) else {
            return
        }
        
        let player = AVPlayer(url: videoURL)
        
        let controller = AVPlayerViewController()
        controller.player = player
        
        present(controller, animated: true){
            player.play()
        }

    }
    
    
    
    override func viewDidLoad() {
        
        self.tableone.rowHeight = 100
        
        ref = Database.database().reference().child("english")
        
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.table.removeAll()
                
                for video in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let Object = video.value as? [String: AnyObject]
                    let Name = Object?["name"]
                    let videolink = Object?["link"]
                    
                    let video = english(name: Name as? String, link: videolink as? String)
                    self.table.append(video)
                    
                    self.tableone.reloadData()
                }
            }
        })
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
