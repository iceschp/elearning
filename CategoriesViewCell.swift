//
//  Categories.swift
//  studyIOS
//
//  Created by ice ice on 12/1/20.
//

import UIKit


class CategoriesViewCell: UICollectionViewCell {
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
}

struct Categories {
    var type:[String] {
        return ["science","code","thai","math","english"]
    }
    var imgtype:[UIImage] {
        return [UIImage(named: "sci.png")!,UIImage(named: "code.png")!,UIImage(named: "thai.png")!,UIImage(named: "math.png")!,UIImage(named: "english.png")!]
    }
}

