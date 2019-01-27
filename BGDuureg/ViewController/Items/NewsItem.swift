//
//  NewsItem.swift
//  BGDuureg
//
//  Created by Bolorhuu on 11/7/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class NewsItem: NSObject {
    
    var id = String()
    var title = String()
    var picture = String()
    var created_at = String()
    
    init(dic:NSDictionary){
        self.id = dic["id"] as! String
        self.title = dic["title"] as! String
        self.picture = dic["picture"] as! String
        self.created_at = dic["created_at"] as! String
    }
}
