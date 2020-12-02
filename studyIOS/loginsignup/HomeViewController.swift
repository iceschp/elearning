//
//  HomeViewController.swift
//  studyIOS
//
//  Created by ice ice on 10/26/20.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBAction func bntLetgo(_ sender: UIButton) {
        
        let homeViewController = self.storyboard?.instantiateViewController(identifier: "tohomehome") as! Navcon
        self.view.window?.rootViewController = homeViewController
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
