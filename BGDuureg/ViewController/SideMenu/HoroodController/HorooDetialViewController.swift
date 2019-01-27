//
//  HorooDetialViewController.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 3/19/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class HorooDetialViewController: UIViewController {

    
    var horooId = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        let webUrl = NSURL(string: "http://bgd.mn/horood/khoroo"+"\(horooId)"+"desc.php");
        // Do any additional setup after loading the view.
        
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
    
//
//
//    @IBAction func serverButtonClicked(_ sender: Any) {
//
//    }
//
//    @IBAction func locationButtonClicked(_ sender: UIButton) {
//    }
//
//    @IBAction func numberListButtonClicked(_ sender: UIButton) {
//    }
    
    
}
