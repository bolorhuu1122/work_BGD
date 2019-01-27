//
//  ServiceViewController.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 12/29/17.
//  Copyright © 2017 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController {
    var bla : NSString?
    
    
    var service: NSArray =  ["Засаг Даргын Тамгын газар",
                            "Ахмадын хороо",
                            "Албан бус насан туршийн боловсрол олгох төв",
                            "Баянгол агропарк ОНӨТҮГ ",
                            "Баянгол шинэ өргөө ОНӨТҮГ"
                            ,"Биеийн тамир спортын хороо"
                            ,"Боловсролын хэлтэс"
                            ,"Улсын бүртгэлийн хэлтэс"
                            ,"Дотоод аудит"
                            ,"Эрүүл мэндийн нэгдэл"
                            ,"Газрын алба"
                            ,"Гэр бүл хүүхэд залуучуудын хэлтэс"
                            ,"Хөдөлмөр халажийн үйлчилгээний хэлтэс"
                            ,"Хүүхэд залуучуудын хөгжлийн ордон"
                            ,"Жижиг дунд үйлдвэрлэлийг дэмжих төв"
                            ,"Мэргэжлийн хяналт"
                            ,"Онцгой байдлын хэлтэс"
                            ,"Худалдан авах ажиллагааны алба"
                            ,"Статистикийн хэлтэс"
                            ,"Татварын хэлтэс"
                            ,"Цагдаагын I "
                            ,"Цагдаагын II"
                            ,"Усан спорт сургалтын төв"
                            ,"Гэр бүл ёслолын ордон"
                            ,"Замын цагдаа"
                            ,"Баянгол хүүхдийн зуслан"]
   
    var serviceUrl :NSArray = ["",
                            "http://bgd.mn/hariya-heltes/ahmad.php"
                            ,"http://bgd.mn/hariya-heltes/alban.php"
                            ,"http://bgd.mn/hariya-heltes/bayangol%20agropark.php"
                            ,"http://bgd.mn/hariya-heltes/bayangol%20shin%20urguu.php"
                            ,"http://bgd.mn/hariya-heltes/biyiintamir.php"
                            ,"http://bgd.mn/hariya-heltes/bolovsrol.php"
                            ,"http://bgd.mn/hariya-heltes/burtgel.php"
                            ,"http://bgd.mn/hariya-heltes/dotood%20audit.php"
                            ,"http://bgd.mn/hariya-heltes/eruulmend.php"
                            ,"http://bgd.mn/hariya-heltes/gazar.php"
                            ,"http://bgd.mn/hariya-heltes/gerbul.php"
                            ,"http://bgd.mn/hariya-heltes/hudulmur.php"
                            ,"http://bgd.mn/hariya-heltes/huuhed.php"
                            ,"http://bgd.mn/hariya-heltes/jdu.php"
                            ,"http://bgd.mn/hariya-heltes/mergejil.php"
                            ,"http://bgd.mn/hariya-heltes/ontsgoi.php"
                            ,"http://bgd.mn/hariya-heltes/procurement.php"
                            ,"http://bgd.mn/hariya-heltes/statistic.php"
                            ,"http://bgd.mn/hariya-heltes/tatvar.php"
                            ,"http://bgd.mn/hariya-heltes/tsagdaa1.php"
                            ,"http://bgd.mn/hariya-heltes/tsagdaa2.php"
                            ,"http://bgd.mn/hariya-heltes/usansport.php"
                            ,"http://bgd.mn/hariya-heltes/yosloliin.php"
                            ,"http://bgd.mn/hariya-heltes/zamiintsagdaa.php"
                            ,"http://bgd.mn/hariya-heltes/zuslan.php"]
    
    var serviceImages :NSArray = ["horoo",
        "horoo"
        ,"alban_bus"
        ,"bayngol_agropark"
        ,"bayngol_shine_urguu"
        ,"horoo"
        ,"bayngol_bolowsrol"
        ,"burtgel"
        ,"horoo"
        ,"bgd_eruul_mend"
        ,"gazriin_alba"
        ,"huuhed_zaluu"
        ,"hudulmur"
        ,"horoo"
        ,"horoo"
        ,"mergejliin_hynalt"
        ,"ontsgoi_baidal"
        ,"hudaldan"
        ,"undesnii_stastistic"
        ,"tatvar"
        ,"tsagdaa"
        ,"tsagdaa"
        ,"usan_sport"
        ,"horoo"
        ,"zamiin_tsagdaa"
        ,"horoo"]
    
    var serviceMain: NSArray =  ["Аж ахуйн хэлтэс ",
                                 "Архивийн тасаг",
                                 "Хүнс худалдаа үйлчилгээний хэлтэс",
                                 "Иргэдэд үйлчлэх төв",
                                 "Нийгмийн хөгжлийн хэлтэс"
        ,"Санхүү төрийн сангийн хэлтэс"
        ,"Тохижилт нийтийн аж ахуйн хэлтэс"
        ,"Цэргийн штаб"
        ,"Төлөвлөлт, гүйцэтгэлийн хяналт шинжилгээний хэлтэс"
        ,"Төрийн захиргааны удирдлагын хэлтэс"
    ]
    
    var serviceMainUrl: NSArray =  ["http://bgd.mn/undsen-heltes/ajahui.php",
                                 "http://bgd.mn/undsen-heltes/archive.php",
                                 "http://bgd.mn/undsen-heltes/huns.php",
                                 "http://bgd.mn/undsen-heltes/irged.php",
                                 "http://bgd.mn/undsen-heltes/niigem.php"
        ,"http://bgd.mn/undsen-heltes/sanhuu.php"
        ,"http://bgd.mn/undsen-heltes/tohijilt.php"
        ,"http://bgd.mn/undsen-heltes/tsereg.php"
        ,"http://bgd.mn/undsen-heltes/tuluvlult.php"
        ,"http://bgd.mn/undsen-heltes/turiin.php"
    ]
    var scrollView1 = UIScrollView()
    var scrollView2 = UIScrollView()
    let button1  = UIButton()
    let button2  = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false

        self.view.backgroundColor = .white
        self.title = "Төрийн үйлчилгээ"
//        print("bla = \(bla)");
        
//        let button1  = UIButton()
        button1.frame =  CGRect(x:0, y:0, width:self.view.frame.size.width/2,height:50)
        button1.setTitle("Үндсэн хэлтэс", for: UIControlState.normal)
        button1.backgroundColor = .gray
        button1.addTarget(self, action: #selector(ServiceViewController.button1Clicked(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button1)
        
//        let button2  = UIButton()
        button2.frame =  CGRect(x:button1.frame.maxX, y:0, width:self.view.frame.size.width/2,height:50)
        button2.setTitle("Харъяа хэлтэс", for: UIControlState.normal)
        button2.backgroundColor = .lightGray
        
        button2.addTarget(self, action: #selector(ServiceViewController.button2Clicked(_:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(button2)
        
        horoodButtons()
        horoodButtons1()
        
        // Do any additional setup after loading the view.
    }
    func horoodButtons(){
        var scrollView: UIScrollView!
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        let navSize = ((self.navigationController?.navigationBar.frame.size.height)!-25)/3
        let buttonHeight = self.view.frame.size.height/3-navSize
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: button1.frame.maxY, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: (self.view.frame.size.height/3)*13   )
        for i in 0..<service.count {
            let k = i/2
            let button  = UIButton()
            let imageView = UIImageView()
            if(i%2==0){
                button.frame =  CGRect(x:0, y:buttonHeight * CGFloat(k), width:self.view.frame.size.width/2,height:buttonHeight)
                imageView.frame = CGRect(x:40, y:(buttonHeight * CGFloat(k)) + 10, width:(self.view.frame.size.width/2) - 80 ,height:buttonHeight-80)
            }else{
                button.frame  = CGRect(x:self.view.frame.size.width/2, y: buttonHeight * CGFloat(k), width:self.view.frame.size.width/2, height: buttonHeight)
                imageView.frame  = CGRect(x:(self.view.frame.size.width/2)+40, y: (buttonHeight * CGFloat(k))+10, width:(self.view.frame.size.width/2)-80, height: buttonHeight-80)
            }
            button.addTarget(self, action: #selector(ServiceViewController.detailCkiled(_:)), for: UIControlEvents.touchUpInside)

            print("size k =  \((k))")
            print("size x =  \((imageView.frame.minX))")
            print("size y =  \((imageView.frame.minY))")

            print("size height \((imageView.frame.size.height))")
            print("size width \((imageView.frame.size.width))")

            
            button.setTitle("\(service[i])", for: UIControlState.normal)
            print("zurag =  \(i) = \(serviceImages[i]) ")
//            imageView.backgroundColor = .red
           if(i%2==0){
                imageView.image = UIImage(named:"\(serviceImages[i])")
                imageView.contentMode = .scaleAspectFit

            }else{
                imageView.image = UIImage(named:"\(serviceImages[i])")
                imageView.contentMode = .scaleAspectFit
            }
//                imageView.clipsToBounds = true
            print("------------------------------------")

            button.contentEdgeInsets = UIEdgeInsetsMake(100,0, -10, 0);

            button.tag = i+1
            
            if(i==0||i==4||i==8||i==12||i==16||i==20||i==24){
                button.backgroundColor  = UIColor(hexString: "0c78be")
            }else if(i==1||i==5||i==9||i==13||i==17||i==21||i==25){
                button.backgroundColor  = UIColor(hexString: "0a6cab")
            }else if(i==2||i==6||i==10||i==14||i==18||i==22||i==26){
                button.backgroundColor  = UIColor(hexString: "0c9abe")
            }else if(i==3||i==7||i==11||i==15||i==19||i==23){
                button.backgroundColor  = UIColor(hexString: "0a8aab")
            }
            
            
            button.titleLabel?.numberOfLines = 5
            button.titleLabel?.textAlignment = .center
            
            
            button.alignContentVerticallyByCenter(offset: 50);
            button.titleLabel?.font = UIFont(name: LIGHTFONT, size: 10)
            scrollView.addSubview(button)
            scrollView.addSubview(imageView)
            scrollView1 = scrollView;
            scrollView1.alpha = 0
        }
        self.view.addSubview(scrollView);
    }
    func horoodButtons1(){
      
        var scrollView: UIScrollView!
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        let navSize = ((self.navigationController?.navigationBar.frame.size.height)!-25)/3
        let buttonHeight = self.view.frame.size.height/3-navSize
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: button1.frame.maxY, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: (self.view.frame.size.height/3)*5+70   )
        for i in 0..<serviceMain.count {
            let k = i/2
            let button  = UIButton()
            let imageView = UIImageView()
            
            if(i%2==0){
                button.frame =  CGRect(x:0, y:buttonHeight * CGFloat(k), width:self.view.frame.size.width/2,height:buttonHeight)
                imageView.frame = CGRect(x:40, y:(buttonHeight * CGFloat(k)) + 10, width:(self.view.frame.size.width/2) - 80 ,height:buttonHeight-80)
            }else{
                button.frame  = CGRect(x:self.view.frame.size.width/2, y: buttonHeight * CGFloat(k), width:self.view.frame.size.width/2, height: buttonHeight)
                imageView.frame  = CGRect(x:(self.view.frame.size.width/2)+40, y: (buttonHeight * CGFloat(k))+10, width:(self.view.frame.size.width/2)-80, height: buttonHeight-80)
            }
            button.setTitle("\(serviceMain[i])", for: UIControlState.normal)
            if(i%2==0){
                imageView.image = UIImage(named:"horoo")
                imageView.contentMode = .scaleAspectFit
                
            }else{
                imageView.image = UIImage(named:"horoo")
                imageView.contentMode = .scaleAspectFit
            }
            button.contentEdgeInsets = UIEdgeInsetsMake(100,0, -10, 0);
            button.addTarget(self, action: #selector(ServiceViewController.detailCkiled1(_:)), for: UIControlEvents.touchUpInside)

            button.tag = i+1
            
            if(i==0||i==4||i==8||i==12||i==16||i==20||i==24){
                button.backgroundColor  = UIColor(hexString: "0c78be")
            }else if(i==1||i==5||i==9||i==13||i==17||i==21||i==25){
                button.backgroundColor  = UIColor(hexString: "0a6cab")
            }else if(i==2||i==6||i==10||i==14||i==18||i==22||i==26){
                button.backgroundColor  = UIColor(hexString: "0c9abe")
            }else if(i==3||i==7||i==11||i==15||i==19||i==23){
                button.backgroundColor  = UIColor(hexString: "0a8aab")
            }
            
            button.titleLabel?.numberOfLines = 5
            button.titleLabel?.textAlignment = .center
            
            button.alignContentVerticallyByCenter(offset: 50);
            button.titleLabel?.font = UIFont(name: LIGHTFONT, size: 10)
            scrollView.addSubview(button)
            scrollView.addSubview(imageView)
            scrollView2 = scrollView;
            
        }
        self.view.addSubview(scrollView);
    }
    @objc func detailCkiled(_ sender:UIButton){
        let detVC = ServiceDetailController()
        detVC.service = serviceUrl[sender.tag-1] as! NSString
        detVC.title = serviceMain[sender.tag-1] as! String
        
        self.navigationController?.pushViewController(detVC, animated: true)

    }
    @objc func detailCkiled1(_ sender:UIButton){
        let detVC = ServiceDetailController()
        detVC.service = serviceMainUrl[sender.tag-1] as! NSString
        detVC.title = serviceMainUrl[sender.tag-1] as! String
        
        self.navigationController?.pushViewController(detVC, animated: true)

    }
    
    @objc func button1Clicked(_ sender:UIButton){
        scrollView1.alpha = 0
        scrollView2.alpha = 1
        button1.backgroundColor = .gray
        button2.backgroundColor = .lightGray
    }
    
    @objc func button2Clicked(_ sender:UIButton){
        scrollView1.alpha = 1
        scrollView2.alpha = 0
        button1.backgroundColor = .lightGray
        button2.backgroundColor = .gray

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
