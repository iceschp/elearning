//
//  first_1ViewController.swift
//  studyIOS
//
//  Created by _MILK_ on 18/11/2563 BE.
//

import UIKit

class first_1ViewController: UIViewController ,UIScrollViewDelegate {
    
    @IBOutlet weak var scrollview: UIScrollView!
    var headerVisible = true
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview.contentSize = CGSize(width: self.view.frame.width, height: 2 * self.view.frame.height)
        // Do any additional setup after loading the view.
    }
   
        
        func hideHeader() {
            self.headerVisible = false
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                let parent = self.parent as! ViewController
                parent.hideHeader()
            })
        }
        
        func showHeader() {
            self.headerVisible = true
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                let parent = self.parent as! ViewController
                parent.showHeader()
            })
        }
    }


extension first_1ViewController{
    
    func scrollViewDidScroll(_ scrollview: UIScrollView) {
        let translation = scrollview.panGestureRecognizer.translation(in: scrollview.superview)
        performHeaderCheck(translation: translation)
    }
    
    func performHeaderCheck(translation:CGPoint) {
        if translation.y == 0 { return }
        if translation.y > 0 {
            // Scroll Down
            if !headerVisible {
                showHeader()
            }
        } else {
            // Scroll Up
            if headerVisible {
                hideHeader()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
