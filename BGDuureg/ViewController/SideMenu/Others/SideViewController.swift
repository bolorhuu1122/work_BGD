//
//  SideViewController.swift
//  BGDuureg
//
//  Created by Bolorhuu on 9/21/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD

class SideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,shareSideButtonDelegate{
    
//    var LeftMenuTable : UITableView = UITableView()
    var dataArray  = NSMutableArray()
    var type = NSString()
    var per_page = 10
    var isReloadTable = Bool()
    var page = 1;
    override func viewDidLoad() {
        super.viewDidLoad()
//        il tod bdal, durem juram n bolchloo
//        http://bgd.mn/json/docs.php?page=1&type=1
        isReloadTable = true

     
//        loadData()
        self.view.addSubview(pdfTableView)
        setNavBackButton()
        //Do any additional setup after loading the view.
    }
  
     lazy var pdfTableView: UITableView = {
       var pdfTableView = UITableView(frame: CGRect(x:0, y:-35, width:self.view.frame.size.width+50, height: self.view.frame.size.height), style: .grouped)
        pdfTableView.delegate = self
        pdfTableView.dataSource = self
        pdfTableView.backgroundColor =  .white
        pdfTableView.register(SideTableViewCell.self, forCellReuseIdentifier: "cell")
        return pdfTableView;
    }()
    
//    il tod bdal, durem juram n bolchloo
//    http://bgd.mn/json/docs.php?page=1&type=1
//    type = 1 bol Төсөв санхүүгийн ил тод байдал
//    type = 2 bol Үйл ажиллагааны ил тод байдал
//    type = 3 bol Хүний нөөцийн ил тод байдал
//    type = 4 bol Худалдан авах ажиллагааны ил тод байдал
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.loadData()
    }
    
    func setNavBackButton(){
        self.navigationItem.leftBarButtonItems = [leftMenuItem()]
        
        //self.navigationItem.title = navTitle as String
    }
    // MARK:left menu items
    func leftMenuItem()->UIBarButtonItem{
        let leftMenuButton = UIButton(type: UIButtonType.custom) as UIButton
        leftMenuButton.frame = CGRect(x:0, y:0, width:30,height: 30)
        leftMenuButton.setImage(UIImage (named: "icon_menu"), for: UIControlState.normal )
        leftMenuButton.addTarget(self, action: #selector(self.leftMenuButtonClicked), for: UIControlEvents.touchUpInside)
        let leftItem : UIBarButtonItem = UIBarButtonItem()
        leftItem.customView = leftMenuButton
        return leftItem
    }
    
    @objc func leftMenuButtonClicked(){
        
        self.menuContainerViewController.toggleLeftSideMenuCompletion({ () -> Void in
        })
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SideTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SideTableViewCell
        cell.tag = indexPath.row
        //        if indexPath.row == menus.count-1 {
        //            cell.endCellBool = true
        //        }else{
        ////            cell.endCellBool = false
        //
        //        }
        //cell.menuLabel.text = menus.object(at: indexPath.row) as? String
        let item = dataArray[indexPath.row] as! SideItem
//        cell.item = item
        cell.delegate = self
        cell.shareButton.tag = indexPath.row
        cell.dateLabel.text = item.date
        cell.dateLabel.highlightedTextColor = UIColor(hexString: "ff7a3c")
        
        cell.titleLabel.text = item.title
        cell.titleLabel.highlightedTextColor = UIColor(hexString: "ff7a3c")
        if (indexPath as NSIndexPath).row == dataArray.count-1 {
            //                print("print = \(indexPath.row)")
            self.loadData()
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataArray[indexPath.row] as! SideItem

        var pdfVC = PdfViewController()
        
        pdfVC.pdfUrlString = item.pdfUrl
        self.navigationController?.pushViewController(pdfVC, animated: true)
    }
    func shareButtonClicked(sender:AnyObject) {
        
        
        let item = dataArray[sender.tag] as! SideItem
        let text = item.title
        let url:NSURL = NSURL(string:"\(item.pdfUrl)")! //gallery
        print("url = \(url)")
        let vc = UIActivityViewController(activityItems: [text, url], applicationActivities: [])
        self.present(vc, animated: true, completion: nil)
        
    }
    func loadData(){
        //            if !USERDEF.bool(forKey: "isBase"){
        if(isReloadTable){
        
        let HUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        HUD.label.text = "Мэдээлэл татаж байна";
        let manager :AFHTTPSessionManager = AFHTTPSessionManager()
        var param = NSDictionary()
        param = ["type":type,
                 "page":page] //instal hiiged dahin back hhiiged butsad orohoor anhnii udaa geed first n  1 bgaa  anhii udaa gdg-r ywj bgaa bolohoor buh duugaa dahij ywaad bna.
        // daraagiin udaa app.aa kill hiiged dahin orohoor 0 boltson bolohoor tuhain date.s hoish nemegdsen duuniidiig awj bna. teged awahdaa umnu hadgaltsan bsn duunuuda ustgachaaad bna.
        print("param ==== \(param)")
        
        manager.get("http://bgd.mn/json/docs.php", parameters: param, progress: nil, success: { (task:URLSessionDataTask, responseObject: Any) in
            print("value count ==== \((responseObject as AnyObject).count)")
            print("value ==== \(responseObject)")
            
            if (responseObject as AnyObject).count > 0 {
                let arrayItem = responseObject as! NSArray
                _ = NSDictionary()
                
                for dic in arrayItem {
                    let item  = SideItem(dic: dic as! NSDictionary)
//                    print(" asdasd = \(item.id)")
                    self.dataArray.add(item)
                
                }
                
                if (responseObject as AnyObject).count < self.per_page {
                    self.isReloadTable = false
                    self.pdfTableView.reloadData()
//                    self.refreshController.endRefreshing()
                    
                } else if (responseObject as AnyObject).count == self.per_page {
//                    self.refreshController.endRefreshing()
                    self.pdfTableView.reloadData()
                    self.page += 1
                    print("TENSUU_page = \(self.page)")
                }
            }

        
            HUD.hide(animated: true)

        }) { (operation,error) in
            print("Error: " + error.localizedDescription) //header('Content-Type: text/json;  charset=utf-8');
            HUD.hide(animated: true)
        }
        }
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
