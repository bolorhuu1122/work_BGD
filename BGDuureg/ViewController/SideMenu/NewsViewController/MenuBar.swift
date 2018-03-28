//
//  MenuBar.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 1/21/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//


import UIKit

protocol menuDelegate {
    func scrollToMenuIndex(menuIndex:Int)
}

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    var mainVC: MainViewController?
    var delegate:menuDelegate?
  
    
    let cellId = "cellId"
    let imageNames = ["food", "enjoy", "cosme", "fitnes","travel"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())
        
        setupHorizontalBar()
    }
    
    var horizontalBarLeftAnchorConstraint : NSLayoutConstraint?
    
    func setupHorizontalBar(){
        let horizontalBarView = UIView()
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        
        //        horizontalBarView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        addSubview(horizontalBarView);
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: leftAnchor)
        
        horizontalBarLeftAnchorConstraint?.isActive = true;
        horizontalBarView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true;
        horizontalBarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/5).isActive = true;
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true;
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        cell.imageView.image = UIImage(named: imageNames[(indexPath as NSIndexPath).item])
        
        if (indexPath.row==0){
            
            cell.backgroundColor = UIColor(hexString: "FFD573")
        }else if (indexPath.row==1){
            cell.backgroundColor = UIColor(hexString: "B4A5CF")
        }else if (indexPath.row==2){
            cell.backgroundColor = UIColor(hexString: "F47A8F")
        }else if (indexPath.row==3){
            cell.backgroundColor = UIColor(hexString: "7ED321")
        }else if (indexPath.row==4){
            cell.backgroundColor = UIColor(hexString: "7AAAD7")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 5, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

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

class MenuCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        
        //        iv.image = UIImage(named: "food")?.withRenderingMode(.alwaysTemplate)
        //        iv.tintColor = UIColor.red
        
        return iv
    }()
    let nameLabel: UILabel = {
        let iv = UILabel()
        iv.text = "хайр"
        //        iv.tintColor = UIColor.red
        return iv
    }()
    override var isHighlighted: Bool {
        didSet {
            
            //            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.brown
        }
    }
    
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = 1
            self.layer.borderColor = isSelected ? UIColor.white.cgColor : UIColor.clear.cgColor
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(nameLabel)
        addConstraintsWithFormat("H:[v0(32)]", views: imageView)
        addConstraintsWithFormat("V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}









