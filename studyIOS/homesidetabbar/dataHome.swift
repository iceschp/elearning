//
//  dataHome.swift
//  studyIOS
//
//  Created by ice ice on 11/25/20.
//

import Foundation
import Firebase

class course{
    var link: String?
    var data : String?
    var mentor : String?
    var rate : String?
    var title : String?
    
    init(link: String?, data: String?,mentor: String?,rate: String?,title: String?){
        self.link = link;
        self.data = data;
        self.mentor = mentor;
        self.rate = rate;
        self.title = title;
    }
}
