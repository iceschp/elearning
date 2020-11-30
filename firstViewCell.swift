//
//  firstViewCell.swift
//  studyIOS
//
//  Created by ice ice on 11/27/20.
//

import UIKit

class firstViewCell: UITableViewCell {

    @IBOutlet weak var lbhometable: UILabel!
    @IBOutlet weak var lbMentor: UILabel!
    @IBOutlet weak var lbRate: UILabel!
    @IBOutlet weak var lbImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
