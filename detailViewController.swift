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
    
    var mentor : String!
    var link : NSURL!
    var data : String!
    var rate : Float!

    @IBOutlet weak var txtMentor1: UILabel!
    @IBOutlet weak var txtName1: UILabel!
    @IBOutlet weak var txtData1: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
