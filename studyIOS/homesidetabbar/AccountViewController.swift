//
//  AccountViewController.swift
//  studyIOS
//
//  Created by ice ice on 11/18/20.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        func alertlogOut() {
            let alert = UIAlertController(title: "Sign out", message: "Do you wanna logout?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            let ok = UIAlertAction(title: "Logout", style: .default, handler: { _ in
                
                let SignupViewController = self.storyboard?.instantiateViewController(withIdentifier:Constant.Storyboard.MenuViewController) as! LoginViewController
    
                    self.view.window?.makeKeyAndVisible()
            })
            
            alert.addAction(cancel)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }

} 
