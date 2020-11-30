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
    
    @IBOutlet weak var collection: UICollectionView!
    
    static let subtoDetail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController")

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        // Do any additional setup after loading the view.
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
extension SecondViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catsub.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collection.dequeueReusableCell(withReuseIdentifier: "Categories", for: indexPath) as! CategoriesViewCell
        cell.categoriesLabel.text = catsub[indexPath.row]
        print(catsub)
        cell.featuredImageView.image = UIImage.init(named: catsub[indexPath.row])
        
        return cell
    }
    
    
}
