//
//  AppDelegate.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 12/29/17.
//  Copyright © 2017 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
       
        UINavigationBar.appearance().isTranslucent = false

        

        
//        let intro = IntroViewController()
//        let navigationController = UINavigationController(rootViewController: intro)
//        navigationController.navigationBar.isHidden = true
////        let container = MFSideMenuContainerViewController()
////        container.centerViewController = navigationController
////        let leftVC = LeftMenuViewController()
////        container.leftMenuViewController  = leftVC
//        self.window?.rootViewController = navigationController
        if !UserDefaults.standard.bool(forKey: "TUTORIAL"){
            print("tutorial1")
            let tutorialVC = IntroViewController()
            let navigationController = UINavigationController(rootViewController: tutorialVC)
            tutorialVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.window?.rootViewController = navigationController

        }else{
            let tabBarController = MainTabBarController()
            let navigationController = UINavigationController(rootViewController: tabBarController)
            
            let container = MFSideMenuContainerViewController()
            container.centerViewController = navigationController
            let leftVC = LeftMenuViewController()
            container.leftMenuViewController  = leftVC
            self.window?.rootViewController = container
        }
       

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

