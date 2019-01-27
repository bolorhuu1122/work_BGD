//
//  AbstractViewController.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 12/29/17.
//  Copyright © 2017 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class AbstractViewController: UIViewController {

        var bgImage: UIImageView?
        var bodyTextView:UITextView = UITextView()
        var navTitle :NSString = NSString()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setNavBackButton()
            let titleDict: NSDictionary = [NSAttributedStringKey.foregroundColor: YELLOWCOLOR!]
            self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [NSAttributedStringKey : Any]
            
            self.title = navTitle as String
            
            CreateTutorial()
        }
        
        func CreateTutorial(){
            //        let tutorialVC = TutorialViewController()
            //        tutorialVC.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            //        self.presentViewController(tutorialVC, animated: false, completion: nil)
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
        
        func showBackButton(){
            let backButton : UIButton = UIButton(frame: CGRect(x:0, y:0, width:44,height: 44))
            backButton.setImage(UIImage(named: "icon_back_nav"), for: UIControlState.normal)
            backButton.addTarget(self, action: #selector(AbstractViewController.goBack), for: UIControlEvents.touchUpInside)
            
            let back:UIBarButtonItem  = UIBarButtonItem()
            back.customView = backButton
            self.navigationItem.leftBarButtonItem = back
            
        }
        @objc func goBack(){
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        
        @objc func leftMenuButtonClicked(){
            
            self.menuContainerViewController.toggleLeftSideMenuCompletion({ () -> Void in
            })
        }

    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            //Dispose of any resources that can be recreated.
        }
}
