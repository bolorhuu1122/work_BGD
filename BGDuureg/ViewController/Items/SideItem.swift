//
//  SideItem.swift
//  BGDuureg
//
//  Created by Bolorhuu on 11/4/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class SideItem: NSObject {
    var date = String()
    var pdfUrl = String()
    var title = String()
    
    init(dic:NSDictionary){
        self.date = dic["created_at"] as! String
        self.pdfUrl = dic["picture"] as! String
        self.title = dic["title"] as! String
        
    }
}
