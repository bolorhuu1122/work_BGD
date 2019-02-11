//
//  PhotoViewCollectionInCell.swift
//  BGDuureg
//
//  Created by Bolorhuu on 11/7/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD
protocol photoCellDelegate {
    func cellCliked(id:String)
    func sharedClikcedPhoto(item:NewsItem)

}
//Undsen
class PhotoViewCollectionInCell: BaseCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,shareOntslohDelegate  {
    var delegate:photoCellDelegate?
    var dataArray  = NSMutableArray()
    var type = NSString()
    var per_page = 15
    var isReloadTable = Bool()
    var page = 2;
    
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
        backgroundColor = .brown
        
        isReloadTable = true;
        
        loadData()
        //        collectionView
        addSubview(collectionView)
        collectionView.register(OntslohCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        //        collectionView.register(OntslohCollectionViewCell.self, forCellWithReuseIdentifier: "ontsloh")
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! OntslohCollectionViewCell
//        cell.delegate
        let item = dataArray[indexPath.row] as! NewsItem
        cell.titleLabel.text = item.title
        cell.dateLabel.text = item.created_at
        cell.newLabel.text = "Фото мэдээ"
        cell.delegate = self
        let imageUrl = NSURL(string:item.picture as String);
        cell.newsImage.setImageWith(imageUrl as! URL)
        
        if (indexPath as NSIndexPath).row == dataArray.count-1 {
            //                print("print = \(indexPath.row)")
            self.loadData()
        }
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("print \(indexPath)")
        var item = dataArray[indexPath.row] as! NewsItem
        delegate?.cellCliked(id:item.id)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        let height = (frame.width - 16 - 16) * 9 / 16
        //        if(indexPath.section == 1){
        //            return CGSize(width: frame.width, height: 170)
        //        }else{
        return CGSize(width: frame.width, height: 280)
        //        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func shareButtonClickedDelegate(sender: AnyObject) {
        let item = dataArray[sender.tag] as! NewsItem

        delegate?.sharedClikcedPhoto(item: item)

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
