//
//  ServiceDetailController.swift
//  BGDuureg
//
//  Created by Bolorhuu on 9/21/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit


class ServiceDetailController: UIViewController {

    var service:NSString!
//    var garchig:NSString!

    override func viewDidLoad() {
        super.viewDidLoad()
        let webUrl = NSURL(string:service as String);
        // Do any additional setup after loading the view.


//        self.title = "\(garchig)" as NSString
//        NSLog("service = \(service)")
        let webView:UIWebView = UIWebView(frame: CGRect(x:0, y:0, width: self.view.frame.size.width, height:self.view.frame.size.height-70))
        
        self.view.addSubview(webView)
        
        webView.delegate = self as? UIWebViewDelegate
        
        let webRequest : URLRequest = URLRequest(url: webUrl! as URL)
        webView.loadRequest(webRequest as URLRequest)
        
        //        let request = (URL: url! as URL);
        //        webView.loadRequest(NSURLRequest(URL: url as! URL))
        //        webView.load(URLRequest(url: url) as URLRequest, mimeType: "")
        //        webView.allowsBackForwardNavigationGestures = true
        
        //        webView.loadRequest(request);
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
