//
//  SciTableViewCell.swift
//  studyIOS
//
//  Created by ice ice on 12/1/20.
//

import UIKit

class SciTableViewCell: UITableViewCell {
    @IBOutlet weak var lbScitable: UILabel!
    @IBOutlet weak var lbSciMentor: UILabel!
    @IBOutlet weak var lbSciRate: UILabel!
    @IBOutlet weak var lbSciImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
