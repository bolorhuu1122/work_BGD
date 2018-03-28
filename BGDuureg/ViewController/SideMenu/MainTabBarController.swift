//
//  MainTabBarController.swift
//  Baby
//
//  Created by Bolorhuu s on 8/16/16.
//  Copyright © 2016 Bolorhuu s. All rights reserved.
//

import Foundation
import UIKit
import AFNetworking
//extension UIImage {
//    func imageWithColor(tintColor: UIColor) -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
//        
//        let context = UIGraphicsGetCurrentContext() as CGContext!
////        CGContext.translateBy(context).(,0, self.size.height)
//        context?.translateBy(x:0,y:self.size.height)
//        context?.scaleBy(x: 1.0, y: -1.0)
//        context!.setBlendMode(CGBlendMode.normal)
//        
//        let rect = CGRect(x:0,y: 0, width:self.size.width, height:self.size.height) as CGRect
//        context?.clip(to: rect, mask: self.cgImage!)
//        tintColor.setFill()
//        context!.fill(rect)
//        
//        let newImage = UIGraphicsGetImageFromCurrentImageContext() as! UIImage
//        UIGraphicsEndImageContext()
//        
//        return newImage
//    }
//    
//    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(size, false, 0)
//        color.setFill()
//        UIRectFill(CGRect(x: 0, y: 0, width: 100, height: 100))
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return image!
//    }   
//}

class MainTabBarController: UITabBarController, UITabBarControllerDelegate{
    var tabBarIndex = false;
    var bla : NSString?
//    var item1 = TabItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftVC:LeftMenuViewController = LeftMenuViewController()

        self.navigationController?.navigationBar.isTranslucent = false

        self.delegate = self
        
        self.view.backgroundColor = UIColor.white

//        self.setNavBackButton()

        UITabBar.appearance().tintColor = YELLOWCOLOR
        UITabBar.appearance().barTintColor = UIColor.white//tabbar background color
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: TEXTCOLOR!], for:.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: YELLOWCOLOR!], for:.selected)
        let newVC = NewsViewController()
        //        tabOne.userItem = userItem
        let tabOneBarItem = UITabBarItem(title: "Мэдээ", image: UIImage(named: "news_icon"), selectedImage: UIImage(named: "selectedImage.png"))
        newVC.tabBarItem = tabOneBarItem
        
        let serVC = ServiceViewController()
        //        tabTwo.userItem = userItem
        let tabTwoBarItem2 = UITabBarItem(title: "Төрийн үйлчилгээ", image: UIImage(named: "goverment_icons"), selectedImage: UIImage(named: "selectedImage2.png"))
        serVC.tabBarItem = tabTwoBarItem2
        
        let horVC = HoroodViewController()
        let tabThreeItem3 = UITabBarItem(title: "Хороод", image: UIImage(named: "flag_icon"), selectedImage: UIImage(named: "selectedImage2.png"))
        horVC.tabBarItem = tabThreeItem3
        
        let feedVC = FeedbackViewController()
        let tabFourItem4 = UITabBarItem(title: "Санал хүсэлт", image: UIImage(named: "feed_icons"), selectedImage: UIImage(named: "feed_selected"))
        feedVC.tabBarItem = tabFourItem4
        self.viewControllers = [newVC, serVC, horVC, feedVC]

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectedIndex = USERDEF.integer(forKey: "index")
        USERDEF.removeObject(forKey: "index")

    }
   
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        self.navigationItem.title = viewController.title?.uppercased()
        
    }
    
    
    func leftMenuItem()->UIBarButtonItem{
        let leftMenuButton = UIButton(type: UIButtonType.custom) as UIButton
        leftMenuButton.frame = CGRect(x:0, y:0,width: 40,height: 50)
        leftMenuButton.setImage(UIImage (named: "icon_menu.png"), for: UIControlState.normal )
        leftMenuButton.addTarget(self, action:#selector(self.leftMenuButtonClicked), for: UIControlEvents.touchUpInside)
        let leftItem : UIBarButtonItem = UIBarButtonItem()
        leftItem.customView = leftMenuButton
        return leftItem
    }
    
   @objc func leftMenuButtonClicked(){
        print("asdasdasd")
        self.menuContainerViewController.toggleLeftSideMenuCompletion({ () -> Void in
        })
    }

    
}
