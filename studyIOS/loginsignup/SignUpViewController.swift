//
//  SignUpViewController.swift
//  studyIOS
//
//  Created by ice ice on 10/26/20.
//

import UIKit
import FirebaseAuth
import Firebase


class SignUpViewController: UIViewController {

    
    @IBOutlet weak var signUp: UILabel!
    @IBOutlet weak var ErrorLabel: UILabel!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var FirstNametextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements(){
        // Hide the error labal
        ErrorLabel.alpha = 0
        // style the element
        Utilities.styleTextField(FirstNametextField)
        Utilities.styleTextField(LastNameTextField)
        Utilities.styleTextField(EmailTextField)
        Utilities.styleTextField(PasswordTextField)
        Utilities.styleFilledButton(SignUpButton)
    }

    func validateFields() -> String? {
        // Check that all fields are filled in
        if FirstNametextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            
        return "Please fill in all fields"
      }
        //Check if the password  is secure
        let cleanedPassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //Password isn't secure enough
            return "Please make sure your password is at least 8 characters , contains a special character and a number."
        }
       return nil
    }
    
    
    
    
    
    @IBAction func SignUpTepped(_ sender: Any){
        // Validate the fields
        let error = validateFields()
        if error != nil {
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            // Create cleaned versions of the data
            let firstName = FirstNametextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = LastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // Create the users
            Auth.auth().createUser(withEmail: email, password: password) {
                (result,err) in
                if err != nil {
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                   
                    
                    // User was created successfully ,nowstore the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName ,"lastname":lastName, "uid": result!.user.uid]) {(error) in
                        if error != nil {
                            // Show erroe message
                            self.showError("Error saving user data")
                       }
                    
                    }
                    // Transition to the home screen
                    self.transitionToHome()
                }
                
                
            }
            
        }
        
    }
    func showError(_ message:String) {
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    
    func transitionToHome() {
       let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
  
}
    
  
    


