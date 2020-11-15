//
//  ViewController.swift
//  studyIOS
//
//  Created by ice ice on 10/18/20.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    
    @IBOutlet var signInButton:GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
//        if GIDSignIn.sharedInstance()?.currentUser != nil{
//            //sign in
//        }
//        else{
//            GIDSignIn.sharedInstance()?.signIn()
//        }
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.presentingViewController=self
 }



}
