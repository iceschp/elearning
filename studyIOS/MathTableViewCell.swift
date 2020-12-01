//
//  MathTableViewCell.swift
//  studyIOS
//
//  Created by ice ice on 12/1/20.
//

import UIKit

class MathTableViewCell: UITableViewCell {
    @IBOutlet weak var lbMathtable: UILabel!
    @IBOutlet weak var lbMathMentor: UILabel!
    @IBOutlet weak var lbMathRate: UILabel!
    @IBOutlet weak var lbMathImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
