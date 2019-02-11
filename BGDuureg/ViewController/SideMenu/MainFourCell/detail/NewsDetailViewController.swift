//
//  NewsDetailViewController.swift
//  BGDuureg
//
//  Created by Bolorhuu on 11/7/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD
import WebKit

class NewsDetailViewController: UIViewController,WKUIDelegate {
    var id = String()
    var webView: WKWebView!
    var descHtml = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        loadData()
////        let url = URL(string: "http://bgd.mn/json/news_detail.php?id=\(id)")
//        let html = try! String(contentsOf: url!, encoding: .utf8)
        
        // Do any additional setup after loading the view.
//        loadHTMLStringImage()
        

    }
    func loadHTMLStringImage() -> Void {
        let htmlString = self.descHtml
//        webView.loadHTMLString(htmlString, baseURL: "nil")
//        webView.loadHTMLString(htmlString, baseURL: nil)
//        self.view.addSubview(webView)
    }

    
//
    func loadData(){
            let HUD = MBProgressHUD.showAdded(to: self.view, animated: true)
            let manager :AFHTTPSessionManager = AFHTTPSessionManager()
            let param = ["id":id,
                ] as [String : Any]

            print("Product_Param = \(param)")

            manager.get("http://bgd.mn/json/news_detail.php", parameters: param, progress: nil, success: { (task:URLSessionDataTask, responseObject: Any) in

                    let dic = responseObject as! NSDictionary
                    
                    self.descHtml = dic["description"] as! String
                    print("descHtml=  \(self.descHtml)")
                    self.webView = WKWebView(frame: CGRect(x: 5, y:0, width: self.view.frame.width-10, height: self.view.frame.height))
                    self.webView.loadHTMLString(self.descHtml, baseURL: nil)
                    self.view.addSubview(self.webView)
                    HUD.hide(animated: true)
                HUD.hide(animated: true)

            }) { (URLSessionDataTask, Error) in
                print(Error)
            }
    }
//
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
