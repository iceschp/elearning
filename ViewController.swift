//
//  ViewController.swift
//  studyIOS
//
//  Created by ice ice on 10/18/20.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    
    private let sideMenu = SideMenuNavigationController(rootViewController: UIViewController())
    
    @IBAction func didTapMenubutton() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
 }

}
