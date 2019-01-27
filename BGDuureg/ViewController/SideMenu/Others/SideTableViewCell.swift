//
//  SideTableViewCell.swift
//  BGDuureg
//
//  Created by Bolorhuu on 11/4/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

protocol shareSideButtonDelegate{
    func  shareButtonClicked(sender:AnyObject)
}
class SideTableViewCell: UITableViewCell {
    var delegate:shareSideButtonDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(newsImage)
        self.addSubview(newLabel)
        self.addSubview(titleLabel)
        self.addSubview(dateLabel)
        self.addSubview(shareButton)
        
    
    }
    lazy var newsImage: UIImageView = {
        var newsImage  = UIImageView(frame:CGRect(x: 5, y: 5, width: 100, height: 100))
//        newsImage.backgroundColor = UIColor.blue
        newsImage.layer.cornerRadius = 4
        newsImage.layer.masksToBounds = true
        newsImage.contentMode = .scaleAspectFill
        newsImage.image = UIImage(named:"pdf")
        return newsImage
    }()
    lazy var newLabel: UILabel = {
        var  newLabel = UILabel(frame: CGRect(x: newsImage.frame.maxX+5, y: 5 , width: windowFrame.width - newsImage.frame.size.width-15, height: 15 ))
        //        newLabel.font = UIFont(name: LIGHTFONT, size: 10)
        newLabel.font = UIFont.systemFont(ofSize: 12)
        
        newLabel.textColor = BLUECOLOR
        newLabel.text = "Ил тод байдал"
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
        dateLabel.textAlignment = NSTextAlignment.left
        dateLabel.textColor  = BLUECOLOR
        dateLabel.font = dateLabel.font.withSize(12)

        //        dateLabel.backgroundColor = .blue
        //        dateLabel.sizeToFit()
        return dateLabel
    }()
    
    lazy var shareButton: UIButton = {
        var  shareButton = UIButton(frame: CGRect(x: dateLabel.frame.maxX+5, y: titleLabel.frame.maxY+5 , width: 150, height: 15 ))
        shareButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        shareButton.setTitleColor(BLUECOLOR, for: UIControlState.normal)
        shareButton.setTitle("Хуваалцах", for: UIControlState.normal)
        shareButton.addTarget(self, action: #selector(shareButtonClicked(_ :)), for: UIControlEvents.touchUpInside)
        //        shareButton.backgroundColor = .green
        shareButton.tag = self.tag
        return shareButton
    }()
    @objc func shareButtonClicked(_ sender:AnyObject){
        delegate?.shareButtonClicked(sender:sender)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
