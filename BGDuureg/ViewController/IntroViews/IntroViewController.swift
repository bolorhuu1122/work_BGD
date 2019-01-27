//
//  IntroViewController.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 9/10/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController,UIScrollViewDelegate {
  var arr = ["tut1","tut2","tut3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        for  i in 0..<arr.count {
            let imageView = UIImageView(frame: CGRect(x: scrollImages.frame.size.width * CGFloat(i) ,y: 0, width: scrollImages.frame.size.width, height: scrollImages.frame.size.height))
            imageView.image = UIImage(named:"\(arr[i])")
            print("name = \(arr[i]) frame = \(imageView.frame)")
            scrollImages.addSubview(imageView)
        }
        self.view.addSubview(scrollImages)
        self.view.addSubview(closeButton)

    }
    lazy var scrollImages:UIScrollView = {
        var svImage = UIScrollView(frame:CGRect(x:0,y:0, width:self.view.frame.size.width, height:self.view.frame.size.height-60))
        svImage.contentMode = .scaleAspectFit
        svImage.delegate = self 
        svImage.contentSize = CGSize(width: self.view.frame.size.width * 3 , height: self.view.frame.size.height-80)
        //svImage.userInteractionEnabled = false
        svImage.bounces = false
        svImage.clipsToBounds = true
        svImage.backgroundColor = UIColor(hexString: "EDEDED")
        svImage.isPagingEnabled = true
       
        
        return svImage
    }();
    
    lazy var closeButton: UIButton = {
        var button  = UIButton()
        button  = UIButton(frame: CGRect(x:0,y: scrollImages.frame.maxY, width: self.view.frame.size.width, height: 60))
        button.setTitle("ЭХЛЭХ", for: UIControlState())
        button.setTitleColor(YELLOWCOLOR, for: UIControlState())
        button.addTarget(self, action:#selector(IntroViewController.closeButtonClicked), for: UIControlEvents.touchUpInside)
        button.backgroundColor  = .white
        button.titleLabel?.textAlignment = NSTextAlignment.right
        button.titleLabel?.font = UIFont(name: BOLDFONT, size: 22)
//        button.titleLabel?.textColor = YELLOWCOLOR
        return button
    }();
    
    @objc func closeButtonClicked(){
        USERDEF.set(true, forKey: ("TUTORIAL"))
        USERDEF.synchronize()
//        self.dismiss(animated: true, completion: nil)
            let tabBarController = MainTabBarController()
            let navigationController = UINavigationController(rootViewController: tabBarController)
            let container = MFSideMenuContainerViewController()
            container.centerViewController = navigationController
            let leftVC = LeftMenuViewController()
            container.leftMenuViewController  = leftVC
        self.navigationController?.pushViewController(container, animated: false)
//            self.window?.rootViewController = container
        
    }
 
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        _ = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
        
    }
    
//    func slideImages(){
//        var scrollView: UIScrollView!
//        let screensize: CGRect = UIScreen.main.bounds
//        let screenWidth = screensize.width
//        let screenHeight = screensize.height
//        let image = UIImage(named:images[i])
//
//        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
//        scrollView.contentSize = CGSize(width: screenWidth, height: (image?.size.height)! + 50 )
//        scrollView.delegate = self as UIScrollViewDelegate
//        imageView  = UIImageView(frame:CGRect(x:0,y: 0,width: self.view.bounds.width, height:(image?.size.height)!))
//        imageView.image = UIImage(named:images[i])
//
//        scrollView.minimumZoomScale = 0.5
//        scrollView.maximumZoomScale = 3
//        scrollView.bounces = true
//        scrollView.backgroundColor = MAINCOLOR
//        scrollView.addSubview(imageView)
//        self.view.addSubview(scrollView)
//    }
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
