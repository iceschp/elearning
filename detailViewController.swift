//
//  detailViewController.swift
//  studyIOS
//
//  Created by ice ice on 11/29/20.
//

import UIKit
import FirebaseDatabase
import AVFoundation
import AVKit

class detailViewController: UIViewController {
    
    var titles : String!
    var mentor : String!
    var link : String!
    var data : String!
    var rate : String!
    var img : String!
    

    @IBOutlet weak var txtMentor1: UILabel!  
    @IBOutlet weak var txtName1: UILabel!
    @IBOutlet weak var txtData1: UITextView!
    
    @IBOutlet weak var clickVDO: UIButton!
    
    @IBAction func click(_ sender: Any) {
        let videoURL = URL(string: link)
        let player = AVPlayer(url: videoURL!)
        
        let controller = AVPlayerViewController()
        controller.player = player
        
        present(controller, animated: true){
            player.play()}
        
    }
    
    @IBOutlet weak var Img1: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imgURL = URL(string: img)
        let imgdata = try? Data(contentsOf: imgURL!)
        Img1.image = UIImage(data: imgdata!)
        
        txtMentor1.text = mentor
        txtData1.text = data
        txtName1.text = titles
        
        
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
