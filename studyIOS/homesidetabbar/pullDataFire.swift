//
//  pullDataFire.swift
//  studyIOS
//
//  Created by ice ice on 11/25/20.
//

import Foundation
import Firebase

class datail{
    let key : String
    var name : String!
    var link : NSURL //youtube link
    var links : String! //ดึง youtube ออกมา
    
    var completed : Bool!
    let ref : DatabaseReference!
    
    init(key : String, name : String, link : NSURL , links : String){
        self.key = key
        self.name = name
        self.link = link
        self.links = links
        
        self.ref = nil
    }
    
    init(snapshot : DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String:AnyObject]
        name = snapshotValue["name"] as? String
        links = snapshotValue["link"] as? String
        link = NSURL(string: links)!
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any{
        return[
            "name": name,
            "link": link
        ]
    }
}
