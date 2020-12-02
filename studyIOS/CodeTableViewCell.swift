//
//  CodeTableViewCell.swift
//  studyIOS
//
//  Created by ice ice on 12/1/20.
//

import UIKit
import FirebaseDatabase
import Firebase
import AVKit

class CodeTableViewCell: UITableViewCell{
    
    

    @IBOutlet weak var lbCodetable: UILabel!
    @IBOutlet weak var lbCodeMentor: UILabel!
    @IBOutlet weak var lbCodeRate: UILabel!
    @IBOutlet weak var lbCodeImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
