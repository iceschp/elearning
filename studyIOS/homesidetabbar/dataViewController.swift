//
//  dataViewController.swift
//  studyIOS
//
//  Created by ice ice on 11/25/20.
//

import UIKit
import Firebase

class dataViewController: UIViewController {
    
    var name : String!
    var img : NSURL!

    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var txtShowname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtShowname.text = name
        let imgData = try? Data(contentsOf: img as URL)
        showImg.image = UIImage(data: imgData!)

        // Do any additional setup after loading the view.
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
