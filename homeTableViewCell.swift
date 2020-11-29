//
//  homeTableViewCell.swift
//  studyIOS
//
//  Created by ice ice on 11/25/20.
//

import UIKit
import FirebaseDatabase

class homeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var txtname: UILabel!
    @IBOutlet weak var txtmentor: UILabel!
    @IBOutlet weak var txtrate: UILabel!
    
    
    @IBOutlet weak var showMentor: UILabel!
    @IBOutlet weak var showRate: UILabel!
    @IBOutlet weak var showStar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
