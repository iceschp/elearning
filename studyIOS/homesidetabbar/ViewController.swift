//
//  ViewController.swift
//  studyIOS
//
//  Created by ice ice on 10/18/20.
//

import UIKit
import SideMenu
import Firebase
import AVKit
import FirebaseDatabase

class ViewController: UIViewController, MenuControllerDelegate{

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBOutlet weak var explore: UILabel!
    @IBOutlet weak var tabView: UIView!
    @IBOutlet var buttons:[UIButton]!
    
    var selectedIndex: Int = 0
    var previousIndex: Int = 0
    var viewControllers = [UIViewController]()
    var footerHeight: CGFloat = 50
    
   static let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "first_1ViewController")
    static let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController")
    static let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Signup")
    
    //-------Customsbar------//
    
  
    private var sideMenu: SideMenuNavigationController?
    
    private let accountController = AccountViewController()

    
//    viewDidLoad
    
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
        buttons[selectedIndex].isSelected = true
        tabChanged(buttons[selectedIndex])
    }
    
//    ------------
    
    
    
    
    private func addChildControllers() {
        
        addChild(accountController)

        
        view.addSubview(accountController.view)

        accountController.view.frame = view.bounds

        accountController.didMove(toParent: self)

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
            accountController.view.isHidden = true

        case .account:
            accountController.view.isHidden = false
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
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.tabView.frame = CGRect(x: self.tabView.frame.origin.x, y: (self.view.frame.height + self.view.safeAreaInsets.bottom + 16), width: self.tabView.frame.width, height: self.footerHeight)
        })
    }
    
    func showHeader() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.tabView.frame = CGRect(x: self.tabView.frame.origin.x, y: self.view.frame.height - (self.footerHeight + self.view.safeAreaInsets.bottom + 16), width: self.tabView.frame.width, height: self.footerHeight)
        })
    }
}
//-------Customsbar------//??
// search bar//


