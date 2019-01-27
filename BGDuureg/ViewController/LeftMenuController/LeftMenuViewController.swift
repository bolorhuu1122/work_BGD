//
//  LeftMenuViewController.swift
//  Baby
//
//  Created by Bolorhuu s on 8/10/16.
//  Copyright © 2016 Bolorhuu s. All rights reserved.
//

import UIKit
protocol callTab {
    func callTabBar(index:Int)
}

class LeftMenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var delegate:callTab?

    
    var LeftMenuTable:UITableView = UITableView()
    var menus:NSArray = []
    var icons:NSArray = []
//    var userItem = UserItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menus = ["Мэдээ","Төрийн үйлчилгээ","Хороод","Санал, хүсэлт","Төсөв санхүүгийн ил тод байдал","Үйл ажиллагааны ил тод байдал","Хүний нөөцийн ил тод байдал","Худалдан авах ажиллагааны ил тод байдал"] // заавар -> хөгжүүлэлт, тухай

        //self.view.backgroundColor = UIColor.blueColor()
        LeftMenuTable = UITableView(frame: CGRect(x:0, y:0, width:self.view.frame.size.width+50, height: self.view.frame.size.height), style: .grouped)
        self.LeftMenuTable.delegate = self
        self.LeftMenuTable.dataSource = self
        self.LeftMenuTable.backgroundColor =  .white
        self.LeftMenuTable.register(LeftMenuCell.self, forCellReuseIdentifier: "cell")
//        self.LeftMenuTable.separatorStyle = .none
        self.LeftMenuTable.tableHeaderView = headerView
        
        self.view.addSubview(LeftMenuTable)
        self.view.addSubview(logoImageView)
        //Do any additional setup after loading the view.
    }
    lazy var newsImage: UIImageView = {
        var newsImage  = UIImageView(frame:CGRect(x: 5, y: 5, width: 100, height: 100))
        //        newsImage.backgroundColor = UIColor.blue
        newsImage.layer.cornerRadius = 4
        newsImage.layer.masksToBounds = true
        newsImage.contentMode = .scaleAspectFill
        newsImage.image = UIImage(named:"city_cover")
        return newsImage
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.reloadInputViews()
        self.navigationController?.isNavigationBarHidden = true
        print("viewWillAppear")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LeftMenuCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LeftMenuCell
//        if indexPath.row == menus.count-1 {
//            cell.endCellBool = true
//        }else{
////            cell.endCellBool = false
//
//        }
        cell.menuLabel.text = menus.object(at: indexPath.row) as? String
        cell.cellImage.image = UIImage(named: "leftIcon")
        cell.menuLabel.highlightedTextColor = UIColor(hexString: "ff7a3c")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var controllers: NSArray
       let mainVC :MainTabBarController = MainTabBarController()
        let sideVC :SideViewController = SideViewController()

//        let feedVC:FeedbackViewController = FeedbackViewController()

        let navController: UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController;
        switch indexPath.row {
        case 0:
            mainVC.tabBarController?.selectedIndex = 0
            USERDEF.set(0, forKey: "index")
            USERDEF.synchronize()

            controllers = [mainVC]
            navController.viewControllers = controllers as! [UIViewController]
            break
        case 1:
//            let mainVC = MainTabBarController()
//            mainVC.tabBarController?.selectedIndex = 1
            USERDEF.set(1, forKey: "index")
            USERDEF.synchronize()
            controllers = [mainVC]

            navController.viewControllers = controllers as! [UIViewController]
            break
        case 2:
            USERDEF.set(2, forKey: "index")
            USERDEF.synchronize()

            controllers = [mainVC]
            navController.viewControllers = controllers as! [UIViewController]
            break
        case 3:
            USERDEF.set(3, forKey: "index")
            USERDEF.synchronize()

            controllers = [mainVC]
            navController.viewControllers = controllers as! [UIViewController]

            break
        case 4:
//            USERDEF.set(3, forKey: "index")
//            USERDEF.synchronize()
            
            sideVC.type = "1"
            controllers = [sideVC]
            navController.viewControllers = controllers as! [UIViewController]
            
            break
        case 5:
//            USERDEF.set(3, forKey: "index")
//            USERDEF.synchronize()
            
            sideVC.type = "2"
            controllers = [sideVC]
            navController.viewControllers = controllers as! [UIViewController]
            
            break
        case 6:
//            USERDEF.set(3, forKey: "index")
//            USERDEF.synchronize()
           
            sideVC.type = "3"
            controllers = [sideVC]
            navController.viewControllers = controllers as! [UIViewController]
            
            break
        case 7:
//            USERDEF.set(3, forKey: "index")
//            USERDEF.synchronize()
            sideVC.type = "4"

            controllers = [sideVC]
            navController.viewControllers = controllers as! [UIViewController]
            
            break
        default:
            break
        }
        self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)

    }
    
    lazy var headerView:UIView = {
        var headerView = UIView(frame: CGRect(x:0,y:0,width:self.view.frame.size.width, height: 200))
//        headerView.backgroundColor = UIColor(hexString: "3f8a7e")
        var headerImage = UIImageView(frame: CGRect(x:20,y:50,width:self.view.frame.size.width-130,height: 110))
        headerImage.image = UIImage(named: "header_logo")
        headerImage.contentMode = .scaleAspectFit
        headerView.addSubview(headerImage)
        return headerView
    }()
//    lazy var cameraButton: UIButton = {
//        var xx:CGFloat = 25
//        switch UIScreen.main.bounds.size.height {
//        case 568:
//            xx = 25
//            break
//        case 667:
//            xx = 50
//            print("iphone 6")
//            break
//        case 736.0:
//            xx = 75
//            break
//        default:
//            break
//        }
//
//        var button = UIButton()
//        button  = UIButton(frame: CGRect(x: windowFrame.width/2-50-xx,y:15, width:100, height:100))
//        button.sd_setImageWithURL(NSURL(string:self.userItem.userImage as String), forState: .Normal, placeholderImage: UIImage(named: "icon_camera"))
////        button.backgroundColor  = UIColor(hexString: "3f8a7e")
//        button.layer.cornerRadius = 50
//        button.layer.borderColor = UIColor.white.cgColor
//        button.layer.borderWidth = 1
//        button.clipsToBounds = true
//        button.addTarget(self, action: #selector(LeftMenuViewController.cameraButtonClicked(_:)), for: UIControlEvents.TouchUpInside)
//
//        return button
//    }();
  
    lazy var logoImageView:UIImageView = {
        var xx:CGFloat = 100
        switch UIScreen.main.bounds.size.height {
        case 568:
            xx = 100
            break
        case 667:
            xx = 145
            print("iphone 6")
            break
        case 736.0:
            xx = 175
            break
        default:
            break
        }

        var headerView = UIImageView(frame: CGRect(x:0,y:self.view.frame.size.height-50,width:self.view.frame.size.width-50,height: 50))
        //headerView.backgroundColor = UIColor(hexString: "3f8a7e")
        headerView.image = UIImage(named: "city_cover")
        return headerView
    }()

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
