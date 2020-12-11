//
//  AccountViewController.swift
//  studyIOS
//
//  Created by ice ice on 11/18/20.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {
    
    @IBAction func signout(_ sender: Any) {
        alertlogOut()
    }
    
    func alertlogOut() {
        let alert = UIAlertController(title: "Sign out", message: "Do you want to sign out?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        let ok = UIAlertAction(title: "Logout", style: .default, handler: { _ in
            
            let alertSure = UIAlertController(title: "Sign out?", message: "Are you sure?", preferredStyle: .alert)
            
            let actionSure = UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
               
                let backtoLogin = self.storyboard?.instantiateViewController(identifier: "meowmeow") as! Navmeow
                self.view.window?.rootViewController = backtoLogin
                
                self.view.window?.makeKeyAndVisible()
                self.view.window?.makeKeyAndVisible()
            })
            let actionCancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
            alertSure.addAction(actionSure)
            alertSure.addAction(actionCancel)
            self.present(alertSure, animated: true, completion: nil)
            
        })
        
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
} 
