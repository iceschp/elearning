//
//  FirstViewController.swift
//  studyIOS
//
//  Created by ice ice on 10/26/20.
//

import UIKit
import Firebase
import GoogleSignIn

class FirstViewController: UIViewController {
    @IBOutlet var googleSigninButton: GIDSignInButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBAction func googleSignin(_ sender: Any) {
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        self.view.window?.rootViewController = homeViewController
        
        self.view.window?.makeKeyAndVisible()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

//        
//        if GIDSignIn.sharedInstance()?.currentUser != nil {
//            
//        }
//        else {
//            GIDSignIn.sharedInstance()?.signIn()
//        }
        
       
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
       
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setUpElements() {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
}

}
