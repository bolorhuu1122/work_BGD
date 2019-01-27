//
//  FeedSendViewController.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 5/28/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD

class FeedSendViewController: UIViewController {
    
    var menus:NSArray = []
    var success = Bool()
    var sanalType = NSString()
    //    var item = UserItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Санал хүсэлт"
//        self.menuBarButton()
        
        success = false
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(titleField)
        self.view.addSubview(emailField)
//        self.view.addSubview(phoneField)
        self.view.addSubview(lineView)
        self.view.addSubview(descriptionField)
        self.view.addSubview(lineView1)
        self.view.addSubview(sendButton)
        
        self.view.addSubview(blackView)
        self.messageView.addSubview(messageLabel)
        self.view.addSubview(messageView)
        
        //  self.titleField.text = "\(item.name)"
        //  self.emailField.text = "\(item.mail)"
        //  self.phoneField.text = "\(item.phonenumber)"
        
        
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        self.view.contentOffset = CGPointMake(0, 0);
    //        self.navigationController?.setNavigationBarHidden(false, animated: true)
    //    }
    
    lazy var blackView :UIView = {
        var feview = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        feview.alpha =  0
        feview.backgroundColor = UIColor.black
        feview.tag = 2
        return feview
    }()
    
    
    lazy var messageView: UIView = {
        var view = UIView(frame: CGRect(x: windowFrame.width/2-80,y: windowFrame.height/2-40-(self.navigationController?.navigationBar.frame.size.height)!,width: 160,height: 80 ))
        
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    lazy var messageLabel:UILabel = {
        var  titleLabel = UILabel(frame: CGRect(x: 10, y: 0 , width: 150, height: 80 ))
        titleLabel.font = UIFont(name: LIGHTFONT, size: 15)
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 3
        titleLabel.textAlignment = NSTextAlignment.center
        return titleLabel
    }()
    lazy var titleField: UIPlaceHolderTextView = {
        var textField  = UIPlaceHolderTextView()
        textField  = UIPlaceHolderTextView(frame: CGRect(x: 10,y: 0, width: windowFrame.width-20, height: 42))
        textField.font = UIFont(name: LIGHTFONT, size: 14)
        textField.textColor = UIColor(hexString: "383838")
        textField.backgroundColor = UIColor(hexString: "f6f6f6")
        textField.placeholder  = "Нэр"
        textField.autocorrectionType = .no
        return textField
    }();
    
    lazy var emailField: UIPlaceHolderTextView = {
        var textField  = UIPlaceHolderTextView()
        textField  = UIPlaceHolderTextView(frame: CGRect(x: 10,y: self.titleField.frame.maxY+5, width: windowFrame.width-20, height: 42))
        textField.font = UIFont(name: LIGHTFONT, size: 14)
        textField.textColor = UIColor(hexString: "383838")
        textField.backgroundColor = UIColor(hexString: "f6f6f6")
        textField.placeholder  = "Емайл хаяг *"
        textField.autocorrectionType = .no
        textField.keyboardType = UIKeyboardType.emailAddress
        return textField
    }();
//
//    lazy var phoneField: UIPlaceHolderTextView = {
//        var textField  = UIPlaceHolderTextView()
//        textField  = UIPlaceHolderTextView(frame: CGRect(x: 10,y: self.emailField.frame.maxY+5, width: windowFrame.width-20, height: 42))
//        textField.font = UIFont(name: LIGHTFONT, size: 14)
//        textField.textColor = UIColor(hexString: "383838")
//        textField.backgroundColor = UIColor(hexString: "f6f6f6")
//        textField.placeholder  = "Утас *"
//        textField.autocorrectionType = .no
//        textField.keyboardType = UIKeyboardType.numberPad
//        return textField
//    }();
    
    lazy var lineView: UIView = {
        var lineView  = UIView()
        lineView  = UIView(frame: CGRect(x: 0,y: self.emailField.frame.maxY, width: windowFrame.width, height: 1))
        lineView.backgroundColor = UIColor(hexString: "e9e9e9")
        return lineView
    }();
    
    lazy var descriptionField: UIPlaceHolderTextView = {
        var  textView  = UIPlaceHolderTextView(frame:CGRect(x: 10,y: self.lineView.frame.maxY, width: windowFrame.width-20, height: windowFrame.height-126-44-(self.navigationController?.navigationBar.frame.size.height)!))
        textView.font = UIFont(name: LIGHTFONT, size: 14)
        textView.textColor = UIColor(hexString: "383838")
        textView.backgroundColor = UIColor(hexString: "f6f6f6")
        textView.placeholder  = "Агуулга"
        textView.autocorrectionType = .no
        return textView
    }();
    
    lazy var lineView1: UIView = {
        var lineView1  = UIView()
        lineView1  = UIView(frame: CGRect(x: 0,y: self.descriptionField.frame.maxY, width: windowFrame.width, height: 1))
        lineView1.backgroundColor = UIColor(hexString: "e9e9e9")
        return lineView1
    }();
    
    lazy var sendButton: UIButton = {
        var button  = UIButton()
        button  = UIButton(frame: CGRect(x: 0, y: self.lineView1.frame.maxY, width: windowFrame.width, height: 50))
        button.setTitle("ИЛГЭЭХ", for: UIControlState())
        button.setTitleColor(FACECOLOR, for: UIControlState())
        button.addTarget(self, action: #selector(FeedSendViewController.sendClicked), for: UIControlEvents.touchUpInside)
        button.backgroundColor  = UIColor.white
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14)
        return button
    }();
    
    
    
    @objc func sendClicked () {
                if
                    descriptionField.text.isEmpty ||
                    !Utils.checkMail(email: emailField.text as NSString) ||
                    titleField.text.isEmpty  {
                    checkFields()
                    // print("errorrrrr")
                } else {
                    if !success {
                        let HUD = MBProgressHUD.showAdded(to: self.view, animated: true)
                        let manager :AFHTTPSessionManager = AFHTTPSessionManager()
                        var param = NSDictionary()
        
                        param = ["name":self.titleField.text!,
                                 "type":self.sanalType,
                                 "email":self.emailField.text,
                                 "text":self.descriptionField.text]
                        print("param = \(param)")
        
                        manager.post("http://bgd.mn/json/feedback.php", parameters: param, progress: nil, success: { (task:URLSessionDataTask, responseObject: Any) in
        
                            print("bla = \(responseObject)")
                            let dic:NSDictionary =  responseObject as! NSDictionary;
                            let suc = dic["success"] as! NSNumber
                            if suc == 1 {
                                self.successMessage("АМЖИЛТТАЙ ИЛГЭЭЛЭЭ")
                                self.emailField.layer.borderColor = UIColor.clear.cgColor
//                                self.phoneField.layer.borderColor = UIColor.clear.cgColor
                                self.descriptionField.layer.borderColor = UIColor.clear.cgColor
                                self.success = true
                            }else{
                                self.successMessage(" ДАХИН ОРОЛДОНО УУ")
                                self.success = false
                            }
        
                            HUD.hide(true)
        
                        }) { (operation,error) -> Void in
                            self.successMessage("Илгээхэд алдаа гарлаа")
                            print("error = \(error)")
                            self.success = false
                            HUD.hide(true)
        
                        }
        
                    } else {
                        print("success")
                        self.successMessage("Илгээсэн байна.")
        
                    }
        
                }
        
    }
    func checkFields(){
        if !Utils.checkMail(email: emailField.text as NSString){
            emailField.layer.borderColor = UIColor.red.cgColor
            emailField.layer.borderWidth = 1
            
        }
        
//        if  phoneField.text.isEmpty {
//            phoneField.layer.borderColor = UIColor.red.cgColor
//            phoneField.layer.borderWidth = 1
//        }
//
        if  descriptionField.text.isEmpty {
            descriptionField.layer.borderColor = UIColor.red.cgColor
            descriptionField.layer.borderWidth = 1
        }
        if  titleField.text.isEmpty {
            descriptionField.layer.borderColor = UIColor.red.cgColor
            descriptionField.layer.borderWidth = 1
        }
        
        
        
    }
    func successMessage(_ text:NSString){
        UIView.animate (withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions() ,animations: {
            self.messageView.alpha = 1
            self.blackView.alpha = 0.5
        }, completion: { _ in
            UIView.transition(with: self.messageView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
                self.messageView.alpha = 1
                self.messageLabel.text = text as String
                
                return
            }, completion: { finished in
            })
        })
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.transition(with: messageView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
        }, completion: { finished in
        })
        UIView.animate (withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions() ,animations: {
            self.messageView.alpha = 0
            self.blackView.alpha = 0
            self.messageLabel.text = ""
        }, completion: { _ in
        })
        
    }
    //    func viewAnimation(_ sender:AnyObject){
    //        if selectionView.frame.size.height == 42 {
    //            UIView.animate (withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions() ,animations: {
    //                self.selectionView.frame = CGRect(x: 10,y: 0, width: windowFrame.width-20, height: 42*4)
    //                }, completion: { _ in
    //            })
    //        } else {
    //            UIView.animate (withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions() ,animations: {
    //                self.selectionView.frame = CGRect(x: 10,y: 0, width: windowFrame.width-20, height: 42)
    //                }, completion: { _ in
    //
    //            })
    //        }
    //    }


}
