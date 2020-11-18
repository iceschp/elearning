//
//  ViewController.swift
//  studyIOS
//
//  Created by ice ice on 10/18/20.
//

import UIKit
import SideMenu

class ViewController: UIViewController, MenuControllerDelegate {
    private var sideMenu: SideMenuNavigationController?

    private let settingsController = SettingViewController()
    private let accountController = AccountViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuController(with: SideMenuItem.allCases)

        menu.delegate = self

        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true

        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)

        addChildControllers()
    }

    private func addChildControllers() {
        addChild(settingsController)
        addChild(accountController)

        view.addSubview(settingsController.view)
        view.addSubview(accountController.view)

        settingsController.view.frame = view.bounds
        accountController.view.frame = view.bounds

        settingsController.didMove(toParent: self)
        accountController.didMove(toParent: self)

        settingsController.view.isHidden = true
        accountController.view.isHidden = true
    }

    @IBAction func didTapMenuButton() {
        present(sideMenu!, animated: true)
    }

    func didSelectMenuItem(named: SideMenuItem) {
        sideMenu?.dismiss(animated: true, completion: nil)

        title = named.rawValue
        switch named {
        case .home:
            settingsController.view.isHidden = true
            accountController.view.isHidden = true

        case .account:
            settingsController.view.isHidden = true
            accountController.view.isHidden = false

        case .settings:
            settingsController.view.isHidden = false
            accountController.view.isHidden = true
        }

    }

}


