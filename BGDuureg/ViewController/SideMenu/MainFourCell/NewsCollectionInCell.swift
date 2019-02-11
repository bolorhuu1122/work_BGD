//
//  NewsCollectionInCell.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 9/10/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD
protocol newsCellDelegate {
    func cellCliked(id:String)
    func sharedClikced(item:NewsItem)
}

//Undsen collectionnii celliin dotroh collectionview
class NewsCollectionInCell: BaseCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,shareNewsDelegate {
    
    var delegate:newsCellDelegate?
    var dataArray  = NSMutableArray()
    var type = NSString()
    var per_page = 15
    var isReloadTable = Bool()
    var page = 1;

    let cellId  = "cellId"
    lazy var collectionView:UICollectionView={
        var layout = UICollectionViewFlowLayout()
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        isReloadTable = true;
        loadData()
        backgroundColor = .brown
        //        collectionView
        addSubview(collectionView)
        collectionView.register(NewTableViewCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView.register(OntslohCollectionViewCell.self, forCellWithReuseIdentifier: "ontsloh")
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! NewTableViewCell
        cell.shareButton.tag = indexPath.row
        cell.delegate = self
        let item = dataArray[indexPath.row] as! NewsItem
        cell.titleLabel.text = item.title
        cell.dateLabel.text = item.created_at
        
        let imageUrl = NSURL(string:item.picture as String);
        cell.newsImage.setImageWith(imageUrl as! URL)
        if (indexPath as NSIndexPath).row == dataArray.count-1 {
            //                print("print = \(indexPath.row)")
            self.loadData()
        }
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("print \(indexPath.row)")
        var item = dataArray[indexPath.row] as! NewsItem

        delegate?.cellCliked(id:item.id)
        
//        var detVC = NewsDetailViewController()
//        self.view.
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: frame.width, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func shareButtonClickedDelegate(sender:AnyObject) {
        print("tag = \(sender.tag)")
         let item = dataArray[sender.tag] as! NewsItem
        print("id = \(item.id)")
        delegate?.sharedClikced(item: item)
        
//        let item = dataArray[sender.tag] as! NewsItem
//        let text = item.title
//        let url:NSURL = NSURL(string:"http://bgd.mn/blog.php?p=\(item.id)")!
////        let vc = UIActivityViewController(activityItems:[text, url], applicationActivities:[UIActivity]?)
////        vc.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
////        present(ac, animated: true)
////
////
////        self.present(activityViewController, animated: true, completion: nil)
//        let vc = UIActivityViewController(activityItems: [text, url], applicationActivities: [])
//        self.

    }
    func loadData(){
        if isReloadTable{
            let HUD = MBProgressHUD.showAdded(to: self, animated: true)
            let manager :AFHTTPSessionManager = AFHTTPSessionManager()
            let param = ["type":type,
                         "page":page
                ] as [String : Any]
            
            print("Product_Param = \(param)")
            
            manager.get("http://bgd.mn/json/news.php", parameters: param, progress: nil, success: { (task:URLSessionDataTask, responseObject: Any) in
                
                if (responseObject as AnyObject).count > 0 {
                    let arrayItem = responseObject as! NSArray
                    _ = NSDictionary()
                    
                    for dic in arrayItem {
                        let item  = NewsItem(dic: dic as! NSDictionary)
//                        print(" asdasd = \(item.id)")
                        self.dataArray.add(item)
                        
                    }
                    print("dataArray count = \(self.dataArray.count)")
                    
                    if (responseObject as AnyObject).count < self.per_page {
                        self.isReloadTable = false
                                                self.collectionView.reloadData()
                        //                        self.refreshController.endRefreshing()
                        
                    } else if (responseObject as AnyObject).count == self.per_page {
                        //                        self.refreshController.endRefreshing()
                        //                        self.companyTableView.reloadData()
                        self.page += 1
                        print("TENSUU_page = \(self.page)")
                        
                    }
                    
                                        self.collectionView.reloadData()
                    
                    HUD.hide(animated: true)
                }
                //                print("dataArray.count = \(self.dataArray.count)")
                HUD.hide(animated: true)
                
            }) { (URLSessionDataTask, Error) in
                print(Error)
                
            }
        }   else{
            //            self.refreshController.endRefreshing()
        }
        
    }
    
    
    
}
