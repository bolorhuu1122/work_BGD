//
//  NewTableViewCell.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 1/6/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
        var titleLabel = UILabel()
        var shareButton = UIButton()
        var dateLabel = UILabel()
        var newsImage = UIImageView()
//        var item = ShopItem()
    
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            newsImage  = UIImageView(frame:CGRect(x: 5, y: 5, width: 100, height: 100))
            newsImage.backgroundColor = UIColor.blue
            newsImage.layer.cornerRadius = 4
            newsImage.layer.masksToBounds = true
            newsImage.contentMode = .scaleAspectFill
            self.addSubview(newsImage)
            
            
            titleLabel = UILabel(frame: CGRect(x: newsImage.frame.maxX+5, y: 0 , width: windowFrame.width - newsImage.frame.size.width-15, height: 30 ))
            titleLabel.font = UIFont(name: LIGHTFONT, size: 14)
            titleLabel.textColor = YELLOWCOLOR
            titleLabel.numberOfLines = 3
            //titleLabel.backgroundColor = UIColor.redColor()
            self.addSubview(titleLabel)
            
            
           
            dateLabel = UILabel(frame: CGRect(x: newsImage.frame.maxX+5, y: 80 , width: 100, height: 15 ))
            dateLabel.font = UIFont.systemFont(ofSize: 10)
            dateLabel.textAlignment = NSTextAlignment.left
            dateLabel.text = "2017-01-21"
            dateLabel.backgroundColor = .red
            dateLabel.sizeToFit()
            self.addSubview(dateLabel)
            
            shareButton = UIButton(frame: CGRect(x: dateLabel.frame.maxX+5, y: 80 , width: 150, height: 15 ))
            shareButton.titleLabel?.font = UIFont(name: LIGHTFONT, size: 10)
            shareButton.titleLabel?.textColor = TEXTCOLOR
            shareButton.setTitle("Хуваалцах", for: UIControlState.normal)
            self.addSubview(shareButton)
            
            
            
        }
        override func layoutSubviews() {
            super.layoutSubviews()
//            titleLabel.text = item.shopName as String
//            disCountLabelText.text = "asd"
            //        bodyLabel.attributedText = Utils.lineHeightFuncLabel(item.descriptionText as String as String as NSString, view: bodyLabel, heigth: 5)
//            dateLabel.text = item.created_at as String//.substring(to: 10)
//            newsImage.sd_setImage(with: URL(string:imageUrl+(item.file_picture as String) as String), placeholderImage: UIImage(named: "no_image"))
            titleLabel.sizeToFit()
            //      bodyLabel.sizeToFit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}
