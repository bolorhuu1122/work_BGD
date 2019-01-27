//
//  FeedbackViewController.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 12/29/17.
//  Copyright © 2017 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit
//extension UIButton {
//    func centerImageAndButton(_ gap: CGFloat, imageOnTop: Bool) {
//
//        guard let imageView = self.imageView,
//            let titleLabel = self.titleLabel else { return }
//
//        let sign: CGFloat = imageOnTop ? 1 : -1;
//        let imageSize = imageView.frame.size;
//        let titleSize = titleLabel.bounds.size;
//
//        self.titleEdgeInsets = UIEdgeInsetsMake((imageSize.height+gap)*sign, 0, 0, -titleSize.width);
////        UIEdgeInsetsMake(-(totalHeight - (imageSize?.height)!),
////                         0.0,
////                         0.0,
////                         -CGFloat((titleSize?.width)!));
//
//        self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height+gap)*sign, 0, 0, -titleSize.width);
//
//
//    }
//}
extension UIButton {
    // MARK: - UIButton+Aligment

    func alignContentVerticallyByCenter(offset:CGFloat = 10) {
        let buttonSize = frame.size

        if let titleLabel = titleLabel,
            let imageView = imageView {

            if let buttonTitle = titleLabel.text,
                let image = imageView.image {
                let titleString:NSString = NSString(string: buttonTitle)
                let titleSize = titleString.size(withAttributes: [
                    NSAttributedStringKey.font : titleLabel.font
                    ])
                let buttonImageSize = image.size

                let topImageOffset = (buttonSize.height - ( buttonImageSize.height + offset))/2
                let leftImageOffset = (buttonSize.width - buttonImageSize.width) / 2
                imageEdgeInsets = UIEdgeInsetsMake(-topImageOffset-50,
                                                   leftImageOffset+10,
                                                   0,0)

                let titleTopOffset = topImageOffset + offset + buttonImageSize.height
                let leftTitleOffset = (buttonSize.width - titleSize.width) / 2 - image.size.width

                titleEdgeInsets = UIEdgeInsetsMake(70,
                                                   -50,
                                                   0,10)
            }
        }
    }
}

class FeedbackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "Санал хүсэлт"
        self.view.backgroundColor = .green
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        self.view.addSubview(button4)
        
        // Do any additional setup after loading the view.
    }
    
    lazy var button1: UIButton = {
        var button = UIButton()
        button  = UIButton(frame: CGRect(x:0, y:0, width:self.view.frame.size.width/2, height:self.view.frame.size.height/2-(self.navigationController?.navigationBar.frame.size.height)!-12.5))
        button.setTitle("Хог хаягдал,бохир орчинтой,холбоотой санал хүсэлт", for: UIControlState.normal)
        button.setImage(UIImage(named:"trash"), for:UIControlState.normal)
        button.backgroundColor  = UIColor(hexString: "0c78be")
        button.addTarget(self, action: #selector(FeedbackViewController.feedSendController(_:)), for: UIControlEvents.touchUpInside)
          button.titleLabel?.numberOfLines = 5
        button.titleLabel?.textAlignment = .center
        button.tag = 1
        button.alignContentVerticallyByCenter(offset: 50);
        button.titleLabel?.font = UIFont(name: LIGHTFONT, size: 10)

        return button
    }();
    lazy var button2: UIButton = {
        var button = UIButton()
        button  = UIButton(frame: CGRect(x:self.button1.frame.maxX, y:0, width:self.view.frame.size.width/2,height:self.view.frame.size.height/2-(self.navigationController?.navigationBar.frame.size.height)!-12.5))
        button.setTitle("Зөвшөөрөлгүй зам талбай, хашаа барьж буй тухай санал хүсэлт", for: UIControlState.normal)
        button.setImage(UIImage(named:"road"), for:UIControlState.normal)
        button.backgroundColor  = UIColor(hexString: "0a6cab")
        button.addTarget(self, action: #selector(FeedbackViewController.feedSendController(_:)), for: UIControlEvents.touchUpInside)
          button.titleLabel?.numberOfLines = 5
        button.titleLabel?.textAlignment = .center
        button.alignContentVerticallyByCenter(offset: 50);
        button.titleLabel?.font = UIFont(name: LIGHTFONT, size: 10)
        button.tag = 1

        return button
    }();
    lazy var button3: UIButton = {
        var button = UIButton()
        button  = UIButton(frame: CGRect(x:0, y:self.button1.frame.maxY, width:self.view.frame.size.width/2,height:self.view.frame.size.height/2-(self.navigationController?.navigationBar.frame.size.height)!-12.5))
        button.setTitle("Тохижилт, зам, ногоон байгууламжтай холбоотой санал хүсэлт", for: UIControlState.normal)
        button.setImage(UIImage(named:"forest"), for:UIControlState.normal)

        button.titleLabel?.numberOfLines = 5
        button.backgroundColor  = UIColor(hexString: "0c9abe")
        button.addTarget(self, action: #selector(FeedbackViewController.feedSendController(_:)), for: UIControlEvents.touchUpInside)
        button.titleLabel?.textAlignment = .center
        button.alignContentVerticallyByCenter(offset: 50);
        button.titleLabel?.font = UIFont(name: LIGHTFONT, size: 10)
        button.tag = 1

        return button
    }();
    lazy var button4: UIButton = {
        var button = UIButton()
        button  = UIButton(frame: CGRect(x:self.button3.frame.maxX, y:self.button2.frame.maxY, width:self.view.frame.size.width/2,height:self.view.frame.size.height/2-(self.navigationController?.navigationBar.frame.size.height)!-12.5))
        button.setImage(UIImage(named:"danger"), for:UIControlState.normal)

        button.setTitle("Бусад асуудалтай холбоотой санал хүсэлт", for: UIControlState.normal)
        button.backgroundColor  = UIColor(hexString: "0a8aab")
        button.addTarget(self, action: #selector(FeedbackViewController.feedSendController(_:)), for: UIControlEvents.touchUpInside)
          button.titleLabel?.numberOfLines = 5
        button.titleLabel?.textAlignment = .center
        button.alignContentVerticallyByCenter(offset: 50);
        button.titleLabel?.font = UIFont(name: LIGHTFONT, size: 10)
        button.tag = 1

        return button
    }();
    
    @objc func feedSendController(_ sender:UIButton){
        let sendVC = FeedSendViewController()


        sendVC.sanalType = "\(sender.tag)" as NSString
        self.navigationController?.pushViewController(sendVC, animated: true)
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
