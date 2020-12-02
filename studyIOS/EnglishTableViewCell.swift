//
//  EnglishTableViewCell.swift
//  studyIOS
//
//  Created by ice ice on 12/1/20.
//

import UIKit

class EnglishTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbEngtable: UILabel!
    @IBOutlet weak var lbEngMentor: UILabel!
    @IBOutlet weak var lbEngRate: UILabel!
    @IBOutlet weak var lbEngImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
