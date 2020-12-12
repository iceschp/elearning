//
//  SecondViewController.swift
//  CustomTabBar
//
//  Created by Mehul on 06/12/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import AVKit

class SecondViewController: UIViewController {
    var catsub : [String] = ["sci.png","code.png","thai.png","math.png","english.png"]
    
    var menustr = Categories()
    
    @IBOutlet weak var collection: UICollectionView!
    
    static let subtoDetail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController")

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        // Do any additional setup after loading the view.
    }
}


extension SecondViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menustr.type.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collection.dequeueReusableCell(withReuseIdentifier: "Categories", for: indexPath) as! CategoriesViewCell
        cell.categoriesLabel.text = menustr.type[indexPath.row]
        print(catsub)
        cell.featuredImageView.image = menustr.imgtype[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "segues":
            guard let indexPath = (sender as? UIView)?.findCollectionViewIndexPath() else { return }
            
            if indexPath == [0, 0] {
                print(indexPath)
                let sci = storyboard?.instantiateViewController(identifier: "scienceview") as! SciViewController
                present(sci, animated: false, completion: nil)
            }
            else if indexPath == [0, 1] {
                let code = storyboard?.instantiateViewController(identifier: "codeview") as! CodeViewController
                present(code, animated: false, completion: nil)
            }
            else if indexPath == [0,2] {
                let thai = storyboard?.instantiateViewController(identifier: "thaiview") as! ThaiViewController
                present(thai, animated: false, completion: nil)
               
            }
            else if indexPath == [0,3] {
                let math = storyboard?.instantiateViewController(identifier: "mathview") as! MathViewController
                present(math, animated: false, completion: nil)
            }
            else if indexPath == [0,4] {
                let eng = storyboard?.instantiateViewController(identifier: "engview") as! EnglishViewController
                present(eng, animated: false, completion: nil)
            }
        default: return
        }
    }
}

extension UIView {
    func findCollectionView() -> UICollectionView? {
        if let collectionView = self as? UICollectionView {
            return collectionView
        } else {
            return superview?.findCollectionView()
        }
    }

    func findCollectionViewCell() -> UICollectionViewCell? {
        if let cell = self as? UICollectionViewCell {
            return cell
        } else {
            return superview?.findCollectionViewCell()
        }
    }

    func findCollectionViewIndexPath() -> IndexPath? {
        guard let cell = findCollectionViewCell(), let collectionView = cell.findCollectionView() else { return nil }
        return collectionView.indexPath(for: cell)
    }
}
