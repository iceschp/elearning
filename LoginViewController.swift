//
//  LoginViewController.swift
//  studyIOS
//
//  Created by ice ice on 10/26/20.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

   
    @IBOutlet weak var ErrorLabel: UILabel!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements() {
        // Hide the error label
        ErrorLabel.alpha = 0
        //Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(LoginButton)

    
}
    
    @IBAction func loginTapped(_ sender: Any) {
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.ErrorLabel.text = error!.localizedDescription
                self.ErrorLabel.alpha = 1
            }
            else {
                
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
}
