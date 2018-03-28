//
//  HoroodViewController.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 12/29/17.
//  Copyright © 2017 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class HoroodViewController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false

        self.view.backgroundColor = .yellow
       

        print("height = \(3/2)")
        horoodButtons()
        
    }
    
    func horoodButtons(){
        var scrollView: UIScrollView!
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        let navSize = ((self.navigationController?.navigationBar.frame.size.height)!-25)/3
        let buttonHeight = self.view.frame.size.height/3-navSize
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: (self.view.frame.size.height/3)*12   )
        for i in 0...22 {
            let k = i/2
             let button  = UIButton()
            
            if(i%2==0){
               button.frame =  CGRect(x:0, y:buttonHeight * CGFloat(k), width:self.view.frame.size.width/2,height:buttonHeight)
            }else{
                button.frame  = CGRect(x:self.view.frame.size.width/2, y: buttonHeight * CGFloat(k), width:self.view.frame.size.width/2, height: buttonHeight)
            }

            print("size\((self.navigationController?.navigationBar.frame.size.height)!-12.5)")
            button.setTitle("\(i+1)- р хороо", for: UIControlState.normal)
            button.setImage(UIImage(named:"horoo"), for:UIControlState.normal)
            button.tag = i+1
            //        button.sd_setImageWithURL(NSURL(string: self.userItem.userImage as String), forState: .Normal, placeholderImage: UIImage(named: "icon_camera"))
            
            if(i==0||i==4||i==8||i==12||i==16||i==20){
                button.backgroundColor  = UIColor(hexString: "0c78be")
            }else if(i==1||i==5||i==9||i==13||i==17||i==21){
                button.backgroundColor  = UIColor(hexString: "0a6cab")
            }else if(i==2||i==6||i==10||i==14||i==18||i==22){
                button.backgroundColor  = UIColor(hexString: "0c9abe")
            }else if(i==3||i==7||i==11||i==15||i==19||i==23){
                button.backgroundColor  = UIColor(hexString: "0a8aab")
            }
            

            button.addTarget(self, action: #selector(HoroodViewController.cameraButtonClicked(_:)), for: UIControlEvents.touchUpInside)
            button.titleLabel?.numberOfLines = 5
            button.titleLabel?.textAlignment = .center


            button.alignContentVerticallyByCenter(offset: 50);
            button.titleLabel?.font = UIFont(name: LIGHTFONT, size: 10)
            scrollView.addSubview(button)
        }
        self.view.addSubview(scrollView);
    }
    
    @objc func cameraButtonClicked(_ sender:UIButton){
        var detVC = HorooDetialViewController()
        self.navigationController?.pushViewController(detVC, animated: true)
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
