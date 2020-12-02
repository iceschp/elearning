//
//  ThaiTableViewCell.swift
//  studyIOS
//
//  Created by ice ice on 12/1/20.
//

import UIKit

class ThaiTableViewCell: UITableViewCell {
    @IBOutlet weak var lbThaitable: UILabel!
    @IBOutlet weak var lbThaiMentor: UILabel!
    @IBOutlet weak var lbThaiRate: UILabel!
    @IBOutlet weak var lbThaiImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
