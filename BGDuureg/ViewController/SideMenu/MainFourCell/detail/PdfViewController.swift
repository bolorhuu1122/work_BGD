//
//  PdfViewController.swift
//  BGDuureg
//
//  Created by Bolorhuu on 11/4/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class PdfViewController: UIViewController {
    var pdfUrlString = String()
    var pdfUrl = NSURL()
    var docController:UIDocumentInteractionController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        if let url = URL(string: pdfUrl) {
//            if #available(iOS 10.0, *) {
//                UIApplication.shared.open(url)
//            } else {
//                // Fallback on earlier versions
//            }
//        }
        pdfUrl = NSURL(string: pdfUrlString)!
//print("pdfURL = \(pdfUrl)")
//        downloadDoc(pdfUrl: pdfUrl)

        let webView:UIWebView = UIWebView(frame: CGRect(x:0, y:0, width: self.view.frame.size.width, height:self.view.frame.size.height-70))
        
        self.view.addSubview(webView)
        
        webView.delegate = self as? UIWebViewDelegate
        
        let webRequest : URLRequest = URLRequest(url: pdfUrl as URL)
        webView.loadRequest(webRequest as URLRequest)
        
        // Do any additional setup after loading the view.
    }
    func downloadDoc(pdfUrl : NSURL) {
        let urlTest = self.pdfUrl.absoluteString
        let pdfUrl = NSURL(string: urlTest!)
        if(pdfUrl != nil){
            let pdfRequest: NSURLRequest = NSURLRequest(url: pdfUrl! as URL)
            NSURLConnection.sendAsynchronousRequest(pdfRequest as URLRequest, queue: OperationQueue.main) {(response, data, error) in
                let httpResponse = response as? HTTPURLResponse
                if(httpResponse?.statusCode == 200 && error == nil){
                    let documentsUrl =  FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first as! NSURL
                    
                    if let fileName = self.pdfUrl.lastPathComponent {
                        let destinationUrl = documentsUrl.appendingPathComponent(fileName)
                        if let data = data {
                            do {
                                try data.write(to: destinationUrl!, options: .atomic)
                            } catch {
                                print(error)
                            }
                            self.docController = UIDocumentInteractionController(url: destinationUrl!)
                        }
                    }
                    
                }
                
            }
            
        }
        
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
