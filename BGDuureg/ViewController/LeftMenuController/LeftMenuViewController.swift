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
        menus = ["Мэдээ","Төрийн үйлчилгээ","Хороод","Санал, хүсэлт"] // заавар -> хөгжүүлэлт, тухай
        icons = ["home","zaavar","tuhai","garah"]

        //self.view.backgroundColor = UIColor.blueColor()
        LeftMenuTable = UITableView(frame: CGRect(x:0, y:0, width:self.view.frame.size.width+50, height: self.view.frame.size.height), style: .grouped)
        self.LeftMenuTable.delegate = self
        self.LeftMenuTable.dataSource = self
//        self.LeftMenuTable.backgroundColor =  UIColor(hexString: "3f8a7e")
        self.LeftMenuTable.register(LeftMenuCell.self, forCellReuseIdentifier: "cell")
        self.LeftMenuTable.separatorStyle = .none
//        headerView.addSubview(cameraButton)
        headerView.addSubview(nameLabel)
        self.LeftMenuTable.tableHeaderView = headerView
        
        self.view.addSubview(LeftMenuTable)
        self.view.addSubview(logoImageView)
        //Do any additional setup after loading the view.
    }
    
    
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
        if indexPath.row == menus.count-1 {
            cell.endCellBool = true
        }else{
            cell.endCellBool = false

        }
        cell.menuLabel.text = menus.object(at: indexPath.row) as? String
        cell.cellImage.image = UIImage(named: "\(icons.object(at: indexPath.row))")
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var controllers: NSArray
       let mainVC :MainTabBarController = MainTabBarController()

//        let feedVC:FeedbackViewController = FeedbackViewController()

        let navController: UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController;
        switch indexPath.row {
        case 0:
            mainVC.tabBarController?.selectedIndex = 0
            //            secondTab.array = firstArray
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
        default:
            break
        }
        self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)

    }
    
    lazy var headerView:UIView = {
        var headerView = UIView(frame: CGRect(x:0,y:0,width:self.view.frame.size.width, height: 200))
//        headerView.backgroundColor = UIColor(hexString: "3f8a7e")
        //headerImage.image = UIImage(named: "icon_camera")
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
    lazy var nameLabel: UILabel = {
        var xx:CGFloat = 50
        switch UIScreen.main.bounds.size.height {
        case 568:
            xx = 50
            break
        case 667:
            xx = 85
            print("iphone 6")
            break
        case 736.0:
            xx = 120
            break
        default:
            break
        }

        var label = UILabel(frame: CGRect(x:0,y:100, width: windowFrame.width-xx,height:25))
        label.backgroundColor = UIColor.clear
//        label.text = self.userItem.name.uppercaseString
        label.textColor = UIColor.white
//        label.font = UIFont(name: LIGHTFONT, size: 18)
        label.numberOfLines = 1
        label.textAlignment = .center
        //label.sizeToFit()
        return label
    }()
    
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

        var headerView = UIImageView(frame: CGRect(x:50,y:self.view.frame.size.height-45,width:self.view.frame.size.width-50-xx,height: 25))
        //headerView.backgroundColor = UIColor(hexString: "3f8a7e")
        headerView.image = UIImage(named: "gg_logo")
        return headerView
    }()
    
    func cameraButtonClicked(sender:UIButton){
//        var controllers: NSArray
//        let proVC = ProfileViewController()
//        proVC.userItem = self.userItem
//        proVC.navTitle = "МИНИЙ БУЛАН"
//        let navController: UINavigationController = self.menuContainerViewController.centerViewController as! UINavigationController;
//
//        controllers = [proVC]
//        navController.viewControllers = controllers as! [UIViewController]
//        self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)

    }
    
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
