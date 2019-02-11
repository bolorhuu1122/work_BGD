//
//  OntslohCollectionViewCell.swift
//  BGDuureg
//
//  Created by Bolorhuu on 9/22/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit


protocol shareOntslohDelegate {
    func shareButtonClickedDelegate(sender:AnyObject)
}

class OntslohCollectionViewCell: BaseCell {
    var delegate:shareOntslohDelegate?
    
    lazy var newsImage: UIImageView = {
        var newsImage  = UIImageView(frame:CGRect(x: 5, y: 5, width: windowFrame.width-10, height: 180))
        newsImage.backgroundColor = UIColor.lightGray
        newsImage.layer.cornerRadius = 4
        newsImage.layer.masksToBounds = true
        newsImage.contentMode = .scaleAspectFill
        return newsImage
    }()
    lazy var newLabel: UILabel = {
        var  newLabel = UILabel(frame: CGRect(x: 5, y: newsImage.frame.maxY+5 , width: windowFrame.width , height: 15 ))
        //        newLabel.font = UIFont(name: LIGHTFONT, size: 10)
        newLabel.font = UIFont.systemFont(ofSize: 12)
        
        newLabel.textColor = .blue
        newLabel.text = "Онцлох мэдээ"
        newLabel.numberOfLines = 1
        return newLabel
    }()
    
    lazy var titleLabel: UILabel = {
        var  titleLabel = UILabel(frame: CGRect(x: 5, y: newLabel.frame.maxY, width: windowFrame.width-10, height: 50 ))
        titleLabel.font = UIFont(name: LIGHTFONT, size: 12)
        titleLabel.textColor = YELLOWCOLOR
//                titleLabel.backgroundColor = .red
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    lazy var dateLabel: UILabel = {
        var dateLabel = UILabel(frame: CGRect(x: 5, y: titleLabel.frame.maxY , width: windowFrame.width/2-20, height: 15 ))
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textAlignment = NSTextAlignment.left
        dateLabel.textColor  = .blue
//                dateLabel.backgroundColor = .blue
        //        dateLabel.sizeToFit()
        return dateLabel
    }()
    
    lazy var shareButton: UIButton = {
        var  shareButton = UIButton(frame: CGRect(x: dateLabel.frame.maxX+5, y: titleLabel.frame.maxY+5 , width: windowFrame.width/2-20, height: 15 ))
        shareButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        shareButton.setTitleColor(.blue, for: UIControlState.normal)
        shareButton.setTitle("Хуваалцах", for: UIControlState.normal)
        shareButton.addTarget(self, action: #selector(OntslohCollectionViewCell.shareButtonClicked(_ :)), for: UIControlEvents.touchUpInside)

        return shareButton
    }()
    
    @objc func shareButtonClicked(_ sender : AnyObject){
        delegate?.shareButtonClickedDelegate(sender:sender)
    }

    override func setupViews() {
        addSubview(newsImage)
        addSubview(newLabel)
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(shareButton)
        
    }
    
}
