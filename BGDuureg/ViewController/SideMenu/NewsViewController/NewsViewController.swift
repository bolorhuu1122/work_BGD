//
//  NewsViewController.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 12/29/17.
//  Copyright © 2017 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD

class NewsViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,menuDelegate,newsCellDelegate,ontslogCellDelegate,UIScrollViewDelegate,photoCellDelegate,videoCellDelegate {
  
    var collectionview: UICollectionView!
    var cellId = "feedCell"

    var dataArray  = NSMutableArray()
    var type = NSString()
    var per_page = 10
    var isReloadTable = Bool()
    var page = 1;
    let titles=["Шинэ", "Онцлох","Фото","Видео"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false

        self.view.backgroundColor = .red
        self.title = "Нүүр"
        
//        let titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: view.frame.width-32, height: view.frame.height))
//        titleLabel.text = "  Шинэ"
//        titleLabel.textColor = UIColor.gray
//        navigationItem.titleView = titleLabel
        setupCollectionView()
        setupMenuBar()

    }
  
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
//    http://bgd.mn/json/news.php?page=1&type=1
//    ontslox medee /type=1/
//    photo medee /type=2/
//    video medee /type=3/
//    gej avch bgaa
//    http://bgd.mn/json/news_detail.php?id=1808
//    detail xeseg n
    
    fileprivate func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true

        menuBar.delegate = self
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|-0-[v0(40)]", views: menuBar)
//        menuBar.topAnchor.constraint(equalTo:topLayoutGuide.topAnchor).isActive = true
        
    }
    
    //MARK: delegate cell deer darah uyd dood view.g hudugluh function
    func scrollToMenuIndex(menuIndex: Int){
        print("scrollToMenuIndex : menuIndex= \(menuIndex)")
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionview.scrollToItem(at: indexPath as IndexPath, at:.left, animated: true)
        
    }
 
   
    func setupCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(NewsCollectionInCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.register(OntslohCollectionView.self, forCellWithReuseIdentifier: "ontsloh")
        collectionview.register(PhotoViewCollectionInCell.self, forCellWithReuseIdentifier: "photo")
        collectionview.register(VideoCollectionInCell.self, forCellWithReuseIdentifier: "video")

        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        collectionview.isPagingEnabled = true
        collectionview.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        
        self.view.addSubview(collectionview)
    }
    private func setTitleForIndex(index:Int){
        if let titleLabel = navigationItem.titleView as? UILabel{
            titleLabel.text = "\(titles[index])"
        }
    }
    
    //MARK: dood view.g hudulguh uyd duudah menubarnii leine hudulguh function
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("haha = \(scrollView.contentOffset.x)")
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x/5
    }

    //
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x/view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: .right)
        setTitleForIndex(index: Int(index))
        
//        print(targetContentOffset.pointee.x/windowFrame.width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("cellForItemAt : indexpath = \(indexPath)")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsCollectionInCell

        if(indexPath.item == 0 ){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsCollectionInCell
            cell.delegate = self
            return cell
        } else if(indexPath.item == 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ontsloh", for: indexPath) as! OntslohCollectionView
            cell.delegate = self
            return cell
        } else if(indexPath.item == 2) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath) as! PhotoViewCollectionInCell
            cell.delegate = self
            return cell
        }else if(indexPath.item == 3) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "video", for: indexPath) as! VideoCollectionInCell
            cell.delegate = self
            return cell
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("index = \(indexPath)")
//        if(indexPath.)
        scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    //MARK: - cell delageta
    func cellCliked(id:String) {
        
        let detailVC = NewsDetailViewController()
        detailVC.id = id
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    func sharedClikced(item: NewsItem) {
//        let item = dataArray[sender.tag] as! NewsItem
        let text = item.title
        let url:NSURL = NSURL(string:"http://bgd.mn/blog.php?p=\(item.id)")! //gallery
        print("url = \(url)")
        let vc = UIActivityViewController(activityItems: [text, url], applicationActivities: [])
        self.present(vc, animated: true, completion: nil)
    }
    func sharedClikcedPhoto(item: NewsItem) {
        let text = item.title
        let url:NSURL = NSURL(string:"http://bgd.mn/gallery.php?p=\(item.id)")! //gallery
        print("url = \(url)")
        let vc = UIActivityViewController(activityItems: [text, url], applicationActivities: [])
        self.present(vc, animated: true, completion: nil)
    }
    func sharedClikcedVideo(item: NewsItem) {
        let text = item.title
        let url:NSURL = NSURL(string:"http://bgd.mn/video.php?p=\(item.id)")! //gallery
        print("url = \(url)")
        let vc = UIActivityViewController(activityItems: [text, url], applicationActivities: [])
        self.present(vc, animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
