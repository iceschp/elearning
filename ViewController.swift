//
//  ViewController.swift
//  studyIOS
//
//  Created by ice ice on 10/18/20.
//

import UIKit
import SideMenu

class ViewController: UIViewController, MenuControllerDelegate {
    
    
    @IBOutlet weak var tabView: UIView!
    @IBOutlet var buttons:[UIButton]!
    var selectedIndex: Int = 0
    var previousIndex: Int = 0
    var viewControllers = [UIViewController]()
    var footerHeight: CGFloat = 50
   static let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "first_1ViewController")
    static let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")
    static let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController")
    static let fourthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FourthViewController")
    
    //-------Customsbar------//
    
  
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
        //-------Customsbar------//
        addChildControllers()
        viewControllers.append(ViewController.firstVC)
        viewControllers.append(ViewController.secondVC)
        viewControllers.append(ViewController.thirdVC)
        viewControllers.append(ViewController.fourthVC)
        buttons[selectedIndex].isSelected = true
        tabChanged(buttons[selectedIndex])
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

//-------Customsbar------//
extension ViewController {
    
    @IBAction func tabChanged(_ sender: UIButton) {
        previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        sender.isSelected = true
        
        let vc = viewControllers[selectedIndex]
        vc.view.frame = UIApplication.shared.windows[0].frame
        vc.didMove(toParent: self)
        self.addChild(vc)
        self.view.addSubview(vc.view)
        
        self.view.bringSubviewToFront(tabView)
    }
    
    func hideHeader() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.tabView.frame = CGRect(x: self.tabView.frame.origin.x, y: (self.view.frame.height + self.view.safeAreaInsets.bottom + 16), width: self.tabView.frame.width, height: self.footerHeight)
        })
    }
    
    func showHeader() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.tabView.frame = CGRect(x: self.tabView.frame.origin.x, y: self.view.frame.height - (self.footerHeight + self.view.safeAreaInsets.bottom + 16), width: self.tabView.frame.width, height: self.footerHeight)
        })
    }
}
//-------Customsbar------//



