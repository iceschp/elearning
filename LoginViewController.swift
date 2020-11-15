//
//  LoginViewController.swift
//  studyIOS
//
//  Created by ice ice on 10/26/20.
//

import UIKit

class LoginViewController: UIViewController {

   
    @IBOutlet weak var ErrorLabel: UILabel!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements() {
        // Hide the error label
        ErrorLabel.alpha = 0
        //Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(LastNameTextField)
        Utilities.styleFilledButton(LoginButton)

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        func loginTapped(_ sender: Any) {
    }
    
}
}
