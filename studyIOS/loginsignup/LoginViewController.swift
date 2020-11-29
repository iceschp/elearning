//
//  LoginViewController.swift
//  studyIOS
//
//  Created by ice ice on 10/26/20.
//

import UIKit
import FirebaseAuth
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController{

    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var ErrorLabel: UILabel!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet var googleSigninButton:GIDSignInButton!
    @IBAction func googleSignin(_ sender:Any){
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        self.view.window?.rootViewController = homeViewController
        
        self.view.window?.makeKeyAndVisible()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()


        // Do any additional setup after loading the view.
        setUpElements()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        
    //add google sign in butto
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

                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? first_1ViewController

                self.view.window?.rootViewController = homeViewController

                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
}
