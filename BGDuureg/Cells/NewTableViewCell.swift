//
//  NewTableViewCell.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 1/6/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol shareNewsDelegate {
    func shareButtonClickedDelegate(sender:AnyObject)
}
class NewTableViewCell: BaseCell {
    var delegate:shareNewsDelegate?
    
  lazy var newsImage: UIImageView = {
        var newsImage  = UIImageView(frame:CGRect(x: 5, y: 5, width: 100, height: 100))
        newsImage.backgroundColor = UIColor.lightGray
        newsImage.layer.cornerRadius = 4
        newsImage.layer.masksToBounds = true
        newsImage.contentMode = .scaleAspectFill
        return newsImage
    }()
    lazy var newLabel: UILabel = {
        var  newLabel = UILabel(frame: CGRect(x: newsImage.frame.maxX+5, y: 5 , width: windowFrame.width - newsImage.frame.size.width-15, height: 15 ))
//        newLabel.font = UIFont(name: LIGHTFONT, size: 10)
        newLabel.font = UIFont.systemFont(ofSize: 12)

        newLabel.textColor = .blue
        newLabel.text = "Шинэ мэдээ"
        newLabel.numberOfLines = 1
        return newLabel
    }()

    lazy var titleLabel: UILabel = {
      var  titleLabel = UILabel(frame: CGRect(x: newsImage.frame.maxX+5, y: newLabel.frame.maxY+5 , width: windowFrame.width - newsImage.frame.size.width-15, height: 60 ))
        titleLabel.font = UIFont(name: LIGHTFONT, size: 12)
        titleLabel.textColor = YELLOWCOLOR
//        titleLabel.backgroundColor = .red
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    lazy var dateLabel: UILabel = {
        var dateLabel = UILabel(frame: CGRect(x: newsImage.frame.maxX+5, y: titleLabel.frame.maxY+5 , width: 100, height: 15 ))
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textAlignment = NSTextAlignment.left
        dateLabel.textColor  = .blue
//        dateLabel.backgroundColor = .blue
//        dateLabel.sizeToFit()
        return dateLabel
    }()
    
    lazy var shareButton: UIButton = {
        var  shareButton = UIButton(frame: CGRect(x: dateLabel.frame.maxX+5, y: titleLabel.frame.maxY+5 , width: 150, height: 15 ))
        shareButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        shareButton.setTitleColor(.blue, for: UIControlState.normal)
        shareButton.setTitle("Хуваалцах", for: UIControlState.normal)
        shareButton.addTarget(self, action: #selector(NewTableViewCell.shareButtonClicked(_ :)), for: UIControlEvents.touchUpInside)
//        shareButton.backgroundColor = .green

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
