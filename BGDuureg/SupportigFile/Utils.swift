//
//  Utils.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 5/28/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class Utils: NSObject {

    class func checkMail(email:NSString)->Bool{
        // println(email)
        let emailRegEx: NSString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx) //predicateWithFormat("SELF MATCHES %@", emailRegEx)
        if emailTest.evaluate(with: email) == true {
            return true
        }else {
            return false
        }
        
    }
}
