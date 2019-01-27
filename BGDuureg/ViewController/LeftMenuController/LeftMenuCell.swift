//
//  LeftMenuCell.swift
//  Selenge aimag
//
//  Created by Bolorhuu s on 6/3/16.
//  Copyright © 2016 Bolorhuu s. All rights reserved.
//

import Foundation
import UIKit

class LeftMenuCell: UITableViewCell {
    var menuLabel = UILabel()
    var cellImage = UIImageView()
    var lineView = UIView()
    var endCellBool = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.backgroundColor =  UIColor(hexString: "3f8a7e")
        
        cellImage  = UIImageView(frame:CGRect(x:15,y: 5,width: 30, height:30))
        self.addSubview(cellImage)
        
        menuLabel = UILabel(frame: CGRect(x:cellImage.frame.maxX, y:0 , width:self.frame.size.width - cellImage.frame.size.width-80, height:self.frame.size.height ))
        menuLabel.font = menuLabel.font.withSize(12)

        menuLabel.textColor = UIColor(hexString: "0089c8")
        menuLabel.numberOfLines = 3
        self.addSubview(menuLabel)
        
        
        print(self.frame.size.height)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
//        if endCellBool == true {
//            lineView = UIView(frame: CGRect(x:0, y:0 , width:self.frame.size.width,height: 1 ))
//            lineView.backgroundColor = MAINGREEN
//            self.addSubview(lineView)
//
//            lineView = UIView(frame: CGRect(x:0, y: self.frame.size.height , width:self.frame.size.width, height:1 ))
//            lineView.backgroundColor = MAINGREEN
//            self.addSubview(lineView)
//
//        }else{
//            lineView = UIView(frame: CGRect(x:0,y: 0 ,width: self.frame.size.width,height: 1 ))
//            lineView.backgroundColor = MAINGREEN
//            self.addSubview(lineView)
//
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

